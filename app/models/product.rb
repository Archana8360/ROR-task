class Product < ApplicationRecord
    has_and_belongs_to_many :orders
    validates :name, presence: true, uniqueness: { case_sensitive: true }
end
