class Chef < ApplicationRecord
  #validates :chefname, presence: true, length: {maximum: 255}
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_many :recipes
end

#class Chef < ApplicationRecord
  #validates :chefname, presence: true, length: {maximum: 255}
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#  validates :email, presence: true, length: {maximum: 255},uniqueness: { case_sensitive: flase}

#  has_many :recipes
#end
