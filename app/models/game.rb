class Game < ActiveRecord::Base
    default_scope{ order('start_at DESC') }
    validates :start_at, presence: true

    belongs_to :stadium
    belongs_to :schedule

    belongs_to :team_home, :class_name => "Team", 
        :foreign_key => "team_home_id"
    belongs_to :team_visitor, :class_name => "Team", 
        :foreign_key => "team_visitor_id"

    delegate :name, :to => :stadium, :prefix => true
    delegate :number, :start_at, :end_at, :to => :schedule, :prefix => true
    delegate :name, :to => :team_home, :prefix => true
    delegate :name, :to => :team_visitor, :prefix => true
end
