class Game < ActiveRecord::Base
    default_scope{ order('start_at DESC') }

    belongs_to :stadium
    belongs_to :schedule

    belongs_to :team_home, :class_name => "Team",
        :foreign_key => "team_home_id"
    belongs_to :team_visitor, :class_name => "Team",
        :foreign_key => "team_visitor_id"

    validates :team_home_id, presence: true
    validates :team_visitor_id, presence: true
    validates :stadium_id, presence: true
    validates :schedule_id, presence: true
    validates :start_at, presence: true, date: { on_or_after: :schedule_start_at, on_or_before: :schedule_end_at }


    delegate :name, :to => :stadium, :prefix => true
    delegate :name, :start_at, :end_at, :to => :schedule, :prefix => true, :allow_nil => true
    delegate :name, :image, :to => :team_home, :prefix => true
    delegate :name, :image, :to => :team_visitor, :prefix => true


end
