class User < ApplicationRecord
  has_many :reviews
  has_and_belongs_to_many :products
end
