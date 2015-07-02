class Group < ActiveRecord::Base
  validates :name, presence: true

  has_many :members
  has_many :users, through: :members
  has_many :trips

  validates :name, presence: true, uniqueness: true
  has_secure_password

  def join(user)
    begin
      users << user
    rescue ActiveRecord::RecordInvalid => e
      errors.add :users, e.message
    end
  end

  def leave(user)
    users.delete user
  end
end
