class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :last_name, :first_name, :phone, :email, :addresses

  def addresses
    object.addresses.map do |address|
      AddressSerializer.new(address)
    end
  end
end