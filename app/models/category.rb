class Category < ApplicationRecord
  has_many :category_collections
  has_many :collections, :through => :category_collections
  validates :name,
            :presence => true,
            :uniqueness => { case_sensitive: false },
            :length => { minimum: 3, maximum: 25 }
end
