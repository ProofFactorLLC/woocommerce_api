class WoocommerceAPIV2::Variation < WoocommerceAPIV2::ResourceProxy
  DEFAULT_PER_PAGE = 100

  def self.collection_path(product_id)
    "/products/#{product_id}/variations"
  end

  def collection_path
    "/products/#{model.product_id}/variations"
  end

  def reload
    return unless persisted?
    self.load(self.class.find(product_id, id).model.attributes)
  end

  def self.all(product_id)
    resources = self.fetch_all(product_id)
    resources.each do |variation|
      variation['product_id'] = product_id
    end
    extract_resources(resources)
  end

  def self.find(product_id, id)
    return unless id.present?
    resource = http_request(:get, "#{collection_path(product_id)}/#{id}")
    resource['product_id'] = product_id
    self.extract_resource(resource)
  end

  def self.create(product_id, attributes)
    attributes[:product_id] = product_id
    variation = super(attributes)
    variation.product_id = product_id
    variation
  end

  def self.fetch_all(product_id)
    per_page = DEFAULT_PER_PAGE
    base_uri = collection_path(product_id)
    page = 1
    resource_count = per_page
    all_resources = []
    while resource_count == per_page
      resources = http_request(:get, "#{base_uri}?per_page=#{per_page}&page=#{page}&orderby=id&order=asc")
      resource_count = resources.length
      all_resources += resources
      page += 1
    end
    return all_resources
  end
end

class WoocommerceAPIV2::Product < WoocommerceAPIV2::ResourceProxy
  def self.sku(sku)
    extract_resources(http_request(:get, "/products?sku=#{CGI.escape(sku)}"))
  end
end

class WoocommerceAPIV2::Dimensions < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::Customer < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::ProductReview < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::Image < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::Store < WoocommerceAPIV2::ResourceProxy
  def self.details
    extract_resource(http_request(:get, "/"))
  end
end

class WoocommerceAPIV2::Address < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::Order < WoocommerceAPIV2::ResourceProxy
  def self.statuses
    response = http_request(:get, '/orders/statuses')
    response['order_statuses']
  end

  def customer
    model.customer
  end
end

class WoocommerceAPIV2::LineItem < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::ShippingLine < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::FeeLine < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::CouponLine < WoocommerceAPIV2::ResourceProxy
  def coupon
    Coupon.find_by_code(code)
  end
end

class WoocommerceAPIV2::Coupon < WoocommerceAPIV2::ResourceProxy
  def self.find_by_code(code)
    return if code.blank?
    resource = http_request(:get, "#{collection_path}/code/#{code}")
    self.extract_resource(resource)
  end
end

class WoocommerceAPIV2::PaymentDetails < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::OrderRefund < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::OrderNote < WoocommerceAPIV2::ResourceProxy
  def self.collection_path(prefix_options='', param_options=nil)
    "/orders/#{@order_id}/notes/"
  end

  def self.all(order_id)
    return [] unless order_id
    @order_id = order_id
    super({})
  end

  def find(order_id, id)
    @order_id = order_id
    super(id)
  end

  def self.create(order_id, attributes)
    @order_id = order_id
    super(attributes)
  end
end

class WoocommerceAPIV2::Webhook < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::WebhookDelivery < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::PaymentGateway < WoocommerceAPIV2::ResourceProxy
end

class WoocommerceAPIV2::Tool < WoocommerceAPIV2::ResourceProxy
  def self.collection_path(prefix_options='', param_options=nil)
    "/system_status/tools"
  end

  def run
    self.model.confirm = true
    save
  end
end

class WoocommerceAPIV2::SystemStatus < WoocommerceAPIV2::ResourceProxy
  def self.info
    http_request(:get, "/system_status")
  end
end

module WoocommerceAPIV2
  module V2
    class SystemStatus < Resource
    end
  end
end
