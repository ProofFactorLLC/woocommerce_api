require "woocommerce_api_v2/resources/legacy/line_item"

module WoocommerceAPIV2
  module V3
    class OrderRefund < Resource
      attribute :id
      attribute :reason
      attribute :amount, Decimal
      attribute :line_items, Array[LineItem]

      # Read Only
      alias_attribute :date_created, :created_at

      attribute :created_at, DateTime, writer: :private
    end
  end
end
