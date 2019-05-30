require "rubygems"
require "active_support"
require "active_support/core_ext/hash"
require "active_model"
require "httparty"
require "virtus"

require "woocommerce_api_v2/concerns/associations"
require "woocommerce_api_v2/concerns/attribute_assignment"
require "woocommerce_api_v2/concerns/attribute_slicer"
require "woocommerce_api_v2/concerns/singleton"
require "woocommerce_api_v2/concerns/params_converter"
require "woocommerce_api_v2/client"
require "woocommerce_api_v2/client_error"
require "woocommerce_api_v2/oauth_client"
require "woocommerce_api_v2/resource"
require "woocommerce_api_v2/resource_proxy"
require "woocommerce_api_v2/resources/proxy.rb"
require "woocommerce_api_v2/version"

require "woocommerce_api_v2/resources/legacy/address.rb"
require "woocommerce_api_v2/resources/v1/address.rb"
require "woocommerce_api_v2/resources/v2/address.rb"

require "woocommerce_api_v2/resources/legacy/coupon.rb"
require "woocommerce_api_v2/resources/v1/coupon.rb"
require "woocommerce_api_v2/resources/v2/coupon.rb"

require "woocommerce_api_v2/resources/legacy/coupon_line.rb"
require "woocommerce_api_v2/resources/v1/coupon_line.rb"
require "woocommerce_api_v2/resources/v2/coupon_line.rb"

require "woocommerce_api_v2/resources/legacy/customer.rb"
require "woocommerce_api_v2/resources/v1/customer.rb"
require "woocommerce_api_v2/resources/v2/customer.rb"

require "woocommerce_api_v2/resources/legacy/delivery.rb"
require "woocommerce_api_v2/resources/v1/delivery.rb"
require "woocommerce_api_v2/resources/v2/delivery.rb"

require "woocommerce_api_v2/resources/legacy/dimensions.rb"
require "woocommerce_api_v2/resources/v1/dimensions.rb"
require "woocommerce_api_v2/resources/v2/dimensions.rb"

require "woocommerce_api_v2/resources/legacy/fee_line.rb"
require "woocommerce_api_v2/resources/v1/fee_line.rb"
require "woocommerce_api_v2/resources/v2/fee_line.rb"

require "woocommerce_api_v2/resources/legacy/image.rb"
require "woocommerce_api_v2/resources/v1/image.rb"
require "woocommerce_api_v2/resources/v2/image.rb"

require "woocommerce_api_v2/resources/legacy/line_item.rb"
require "woocommerce_api_v2/resources/v1/line_item.rb"
require "woocommerce_api_v2/resources/v2/line_item.rb"

require "woocommerce_api_v2/resources/legacy/meta.rb"

require "woocommerce_api_v2/resources/legacy/order.rb"
require "woocommerce_api_v2/resources/v1/order.rb"
require "woocommerce_api_v2/resources/v2/order.rb"

require "woocommerce_api_v2/resources/legacy/order_note.rb"
require "woocommerce_api_v2/resources/v1/order_note.rb"
require "woocommerce_api_v2/resources/v2/order_note.rb"

require "woocommerce_api_v2/resources/legacy/payment_details.rb"
require "woocommerce_api_v2/resources/v1/payment_details.rb"
require "woocommerce_api_v2/resources/v2/payment_details.rb"

require "woocommerce_api_v2/resources/legacy/product_attribute.rb"
require "woocommerce_api_v2/resources/legacy/product_category.rb"

require "woocommerce_api_v2/resources/legacy/product_review.rb"
require "woocommerce_api_v2/resources/v1/product_review.rb"
require "woocommerce_api_v2/resources/v2/product_review.rb"

require "woocommerce_api_v2/resources/legacy/refund.rb"
require "woocommerce_api_v2/resources/v1/refund.rb"
require "woocommerce_api_v2/resources/v2/refund.rb"

require "woocommerce_api_v2/resources/legacy/shipping_line.rb"
require "woocommerce_api_v2/resources/v1/shipping_line.rb"
require "woocommerce_api_v2/resources/v2/shipping_line.rb"

require "woocommerce_api_v2/resources/legacy/store.rb"
require "woocommerce_api_v2/resources/v1/store.rb"
require "woocommerce_api_v2/resources/v2/store.rb"

require "woocommerce_api_v2/resources/legacy/tax_line.rb"
require "woocommerce_api_v2/resources/v1/tax_line.rb"
require "woocommerce_api_v2/resources/v2/tax_line.rb"

require "woocommerce_api_v2/resources/legacy/webhook.rb"
require "woocommerce_api_v2/resources/v1/webhook.rb"
require "woocommerce_api_v2/resources/v2/webhook.rb"


require "woocommerce_api_v2/resources/legacy/product.rb"
require "woocommerce_api_v2/resources/v1/product.rb"
require "woocommerce_api_v2/resources/v2/product.rb"

require "woocommerce_api_v2/resources/legacy/variation.rb"
require "woocommerce_api_v2/resources/v1/variation.rb"
require "woocommerce_api_v2/resources/v2/variation.rb"

require "woocommerce_api_v2/resources/v2/payment_gateway.rb"
require "woocommerce_api_v2/resources/v2/tool.rb"
