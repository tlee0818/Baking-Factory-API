class OrderItemSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :category, :units_per_item, :active
  
  end
  