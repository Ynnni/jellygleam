class Group < ActiveRecord::Base
  validates :name, presence: true

  has_and_belongs_to_many :users

  validates :name, presence: true, uniqueness: true
  has_secure_password
end
