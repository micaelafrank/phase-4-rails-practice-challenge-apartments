class LeaseSerializer < ActiveModel::Serializer
  attributes :rent
  belongs_to :tenants
  belongs_to :apartment 
end
