class OrderSerializer < ActiveModel::Serializer
  attributes :id, :date, :grandTotal, :customerName, :itemCount

  def grandTotal
    object.grand_total
  end

  def customerName
    object.customer.proper_name
  end

  def itemCount
    object.order_items.count
  end

end
