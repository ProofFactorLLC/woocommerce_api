require "woocommerce_api_v2/resources/v2/line_item"

module WoocommerceAPIV2
  module V2
    class OrderRefund < Resource
      attribute :id
      attribute :reason
      attribute :amount, Decimal
      attribute :line_items, Array[LineItem]

      # Read Only
      attribute :date_created, DateTime, writer: :private
    end
  end
end
