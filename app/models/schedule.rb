class Schedule < ActiveRecord::Base
    default_scope{ order('start_at DESC') }

    validates :name, presence: true, length: { maximum: 50 },
        uniqueness: { case_sensitive: false }
    validates :start_at, presence: true, date: { on_or_after: :season_start_at, on_or_before: :season_end_at }
    validates :end_at, presence: true, date: { after: :season_start_at, on_or_before: :season_end_at}
    validates :season_id, presence: true

    belongs_to :season
    has_many :games, dependent: :destroy

    delegate :name, :start_at, :end_at, :to => :season, :prefix => true
end
