require "woocommerce_api_v2/resources/v1/address"
require "woocommerce_api_v2/resources/v1/customer"
require "woocommerce_api_v2/resources/v1/fee_line"
require "woocommerce_api_v2/resources/v1/shipping_line"
require "woocommerce_api_v2/resources/v1/coupon_line"
require "woocommerce_api_v2/resources/v1/tax_line"

module WoocommerceAPIV2
  module V1
    class Order < Resource
      attribute :id, Integer
      attribute :status
      attribute :set_paid, Boolean

      attribute :billing                   , Address            , writer: :private
      attribute :cart_hash                 , String             , writer: :private
      attribute :cart_tax                  , Decimal            , writer: :private
      attribute :coupon_lines              , Array[CouponLine]  , writer: :private
      attribute :created_via               , String             , writer: :private
      attribute :currency                  , String             , writer: :private
      attribute :customer_id               , Integer            , writer: :private
      attribute :customer_ip_address       , String             , writer: :private
      attribute :customer_note             , String             , writer: :private
      attribute :customer_user_agent       , String             , writer: :private
      attribute :date_completed            , DateTime           , writer: :private
      attribute :date_created              , DateTime           , writer: :private
      attribute :date_modified             , DateTime           , writer: :private
      attribute :date_paid                 , DateTime           , writer: :private
      attribute :discount_tax              , Decimal            , writer: :private
      attribute :discount_total            , Decimal            , writer: :private
      attribute :fee_lines                 , Array[FeeLine]     , writer: :private
      attribute :line_items                , Array[LineItem]    , writer: :private
      attribute :number                    , String             , writer: :private
      attribute :order_key                 , String             , writer: :private
      attribute :parent_id                 , Integer            , writer: :private
      attribute :payment_method            , String             , writer: :private
      attribute :payment_method_title      , String             , writer: :private
      attribute :prices_include_tax        , Boolean            , writer: :private
      attribute :refunds                   , Array[OrderRefund] , writer: :private
      attribute :shipping                  , Address            , writer: :private
      attribute :shipping_lines            , Array[ShippingLine], writer: :private
      attribute :shipping_tax              , Decimal            , writer: :private
      attribute :shipping_total            , Decimal            , writer: :private
      attribute :subtotal                  , Decimal            , writer: :private
      attribute :subtotal_tax              , Decimal            , writer: :private
      attribute :tax_lines                 , Array[TaxLine]     , writer: :private
      attribute :total                     , Decimal            , writer: :private
      attribute :total_discount            , Decimal            , writer: :private
      attribute :total_shipping            , Decimal            , writer: :private
      attribute :total_tax                 , Decimal            , writer: :private
      attribute :transaction_id            , String             , writer: :private
      attribute :version                   , String             , writer: :private

      def order_notes
        WoocommerceAPIV2::OrderNote.all(self.id)
      end

      def paid
        self.date_paid.present?
      end

      def customer
        WoocommerceAPIV2::Customer.find(self.customer_id)
      end

      def shipment_details
        # NOOP
      end
    end
  end
end
