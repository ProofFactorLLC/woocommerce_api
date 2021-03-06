require "woocommerce_api_v2/resources/meta_datum"
module WoocommerceAPIV2
  module V2
    class FeeLine < Resource
      attribute :id, Integer
      attribute :name
      attribute :taxable, Boolean
      attribute :tax_class
      attribute :total, Decimal
      attribute :total_tax, Decimal
      attribute :meta_data, Array[MetaDatum], writer: :private
    end
  end
end
