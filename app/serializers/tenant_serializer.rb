class TenantSerializer < ActiveModel::Serializer
  attributes :name
  has_many :apartments
  has_many :leases

  
end
