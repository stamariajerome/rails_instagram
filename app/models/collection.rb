class Collection < ApplicationRecord
  belongs_to :user
  has_many :category_collections
  has_many :categories, :through => :category_collections
  validates :title, :presence => true
  validates :url, :presence => true
  validates :description, :presence => true, :length => { :maximum => 100 }

  # def to_param
  #   "#{title}".parameterize
  # end
end
