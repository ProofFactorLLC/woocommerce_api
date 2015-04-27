module WoocommerceAPI
  module Singleton
    module ClassMethods
      attr_writer :singleton_name, :collection_name

      def singleton_name
        @singleton_name ||= model_name.element
      end

      def collection_name
        @collection_name ||= model_name.element.pluralize
      end

      def collection_path(prefix_options='', param_options=nil)
        "#{prefix_options}/#{collection_name}#{string_query(param_options)}"
      end

      def string_query(param_options)
        "?#{param_options.to_query}" unless param_options.nil? || param_options.empty?
      end

      def all(params={})
        uri = params[:resource_uri].presence || collection_path(params[:prefix_options], params.slice(:filter, :page, :fields))
        resources = http_request(:get, uri)
        if !resources.nil? and resources.success?
          resources[collection_name].collect { |r| self.new(r) }
        else
          []
        end
      end

      def count
        response = http_request(:get, "#{collection_path}/count")
        response['count'].to_i
      end
      alias_method :size, :count

      def find(id)
        resource = http_request(:get, "#{collection_path}/#{id}")
        self.extract_resource(resource)
      end

      def create(attributes)
        self.new(attributes).create
      end

      def extract_resource(resource)
        self.new(resource[singleton_name])
      end
    end

    module InstanceMethods
      def initialize(attributes={})
        # Rename restricted attributes
        if attributes['attributes']
          attributes['custom_attributes'] = attributes.delete('attributes')
        end
        super
      end

      def singleton_name
        self.class.singleton_name
      end

      def collection_name
        self.class.collection_name
      end

      def collection_path(prefix_options='', query_options=nil)
        self.class.collection_path(prefix_options, query_options)
      end

      def save
        return unless valid?
        method = persisted? ? :put : :post
        resource = self.class.http_request(method, self.to_path, body: self.to_json(root: true))
        self.class.extract_resource(resource)
      end
      alias_method :create, :save

      def destroy
        self.class.http_request(:delete, self.to_path)
      end

      def persisted?
        !!id
      end

      def reload
        return unless persisted?
        self.assign_attributes(self.class.find(self.id).attributes)
      end

      def to_path
        "/#{collection_name}#{"/#{id}" if id}"
      end
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end
