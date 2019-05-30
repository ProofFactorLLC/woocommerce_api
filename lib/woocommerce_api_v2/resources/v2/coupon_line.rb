require "woocommerce_api_v2/resources/meta_datum"
module WoocommerceAPIV2
  module V2
    class CouponLine < Resource
      attribute :id, Integer
      attribute :code
      attribute :amount, Decimal
      attribute :meta_data, Array[MetaDatum], writer: :private
    end
  end
end
