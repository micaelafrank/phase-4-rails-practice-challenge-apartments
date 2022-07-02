class ApartmentSerializer < ActiveModel::Serializer
  attributes :number
  has_many :tenants
  has_many :leases
end
