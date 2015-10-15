module WoocommerceAPI
  class ClientError < StandardError
    attr_accessor :code
    def initialize(code, response)
      @code = code
      message = extract_response(response.parsed_response)
      super(message)
    end

  private

    def extract_response(response)
      case response
      when Array
        response.map{ |value| extract_response(value) }.join(', ')
      when Hash
        extract_response(response.values)
      else
        response.to_s.gsub(/[,.]$/, '')
      end
    end

  end

  class Resource
    include Virtus.model
    include ActiveModel::Model
    include ActiveModel::Serializers::JSON
    include WoocommerceAPI::Singleton
    include WoocommerceAPI::Associations
    include WoocommerceAPI::AttributeAssignment
    self.include_root_in_json = true

    def self.http_request(verb, url, options={})
      response = begin
        if WoocommerceAPI::Client.default_options[:mode] == :oauth_http
          WoocommerceAPI::OauthClient.send(verb, url, options)
        else
          WoocommerceAPI::Client.send(verb, url, options)
        end
      end

      response.success? ? response : raise(ClientError.new(response.code, response))
    end
  end # Resource
end
