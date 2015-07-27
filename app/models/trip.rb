class Trip < ActiveRecord::Base
  belongs_to :start_point, class_name: 'Point'
  belongs_to :end_point, class_name: 'Point'
  belongs_to :group
  belongs_to :owner, class_name: 'User'
  belongs_to :car_type

  has_many :subscribers
  has_many :users, through: :subscribers
end
