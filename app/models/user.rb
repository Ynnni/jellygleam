class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable,
          :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :members
  has_many :groups, through: :members
  has_many :trips, foreign_key: :owner_id

  has_many :subscribers
  has_many :trips, through: :subscribers
end
