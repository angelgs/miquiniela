class Season < ActiveRecord::Base
    default_scope{ order('start_at DESC') }
    
    validates :name, presence: true, length: { maximum: 100 },
        uniqueness: { case_sensitive: false }
    validates :start_at, presence: true
    validates :end_at, presence: true

    has_many :schedules, dependent: :destroy
    
end
