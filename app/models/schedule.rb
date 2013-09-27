class Schedule < ActiveRecord::Base
    default_scope{ order('start_at DESC') }
    
    validates :number, presence: true, length: { maximum: 50 },
        uniqueness: { case_sensitive: false }
    validates :start_at, presence: true
    validates :end_at, presence: true

    belongs_to :season
    has_many :games, dependent: :destroy

    delegate :name, :start_at, :end_at, :to => :season, :prefix => true    
end
