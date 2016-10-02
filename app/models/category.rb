class Category < ApplicationRecord
  validates :name,
            :presence => true,
            :uniqueness => { case_sensitive: false },
            :length => { minimum: 10, maximum: 25 }
end
