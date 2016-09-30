class User < ApplicationRecord
  # TODO dont' need yet?
  has_many :collections, :dependent => :destroy
  belongs_to :role
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  validates :username,
            :presence => true,
            :uniqueness => { :case_sensitive => false }

  validates :email,
            :presence => true,
            :format => { :with => VALID_EMAIL_REGEX },
            :uniqueness => { :case_sensitive => false }

  validates :gender,
            :presence => true

  validates :country,
            :presence => true
end
