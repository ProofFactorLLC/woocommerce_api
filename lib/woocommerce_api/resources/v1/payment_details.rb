module WoocommerceAPIV2
  module V1
    class PaymentDetails < Resource
      attribute :method
      attribute :method_id, Integer
      attribute :method_title
      attribute :paid, Boolean
    end
  end
end
