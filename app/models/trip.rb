class Trip < ActiveRecord::Base
  belongs_to :start_location, class_name: 'Location'
  belongs_to :end_location, class_name: 'Location'
  belongs_to :group
  belongs_to :owner, class_name: 'User'
  belongs_to :transport_type

  has_many :subscribers
  has_many :users, through: :subscribers
end
