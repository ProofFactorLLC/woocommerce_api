require "woocommerce_api_v2/resources/meta_datum"
module WoocommerceAPIV2
  module V2
    class TaxLine < Resource
      attribute :id, Integer
      attribute :code
      attribute :compound, Boolean
      attribute :rate_id, Integer
      attribute :title
      attribute :total, Decimal
      attribute :meta_data, Array[MetaDatum], writer: :private
    end
  end
end
