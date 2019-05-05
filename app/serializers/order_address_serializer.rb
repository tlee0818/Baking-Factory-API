class OrderAddressSerializer < ActiveModel::Serializer
    attributes :id, :customer_id, :recipient, :street_1, :street_2, :city, :state, :zip

    def customer_id
        object.customer.id
    end
    
end
  