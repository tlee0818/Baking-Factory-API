class OrderShowSerializer < ActiveModel::Serializer
    attributes :id, :date, :grandTotal, :customer, :address, :items
  

    def grandTotal
        object.grand_total
      end

    def customer
        OrderCustomerSerializer.new(object.customer)
    end
  
    def address
        OrderAddressSerializer.new(object.address)
    end
  
    def items
        object.order_items.map do |item|
            OrderItemSerializer.new(item.item)
        end
    end
  
  end
  