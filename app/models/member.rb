class Member < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  validates :user_id, uniqueness: { scope: :group_id }
  validates :user_id, :group_id, presence: true
end
