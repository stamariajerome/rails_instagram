class Collection < ApplicationRecord
  belongs_to :user
  validates :title, :presence => true
  validates :url, :presence => true
  validates :description, :presence => true, :length => { :maximum => 100 }

  def to_param
    "#{title}".parameterize
  end
end
