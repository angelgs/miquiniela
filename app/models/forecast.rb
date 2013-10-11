class Forecast < ActiveRecord::Base
  belongs_to :user


  validates :user_id, presence: true


  delegate :name, :to => :user, :prefix => true

end
