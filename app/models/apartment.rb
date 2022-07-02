class Apartment < ApplicationRecord
    has_many :tenants, dependent: :destroy
    has_many :leases, dependent: :destroy
end
