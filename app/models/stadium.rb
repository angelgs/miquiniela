class Stadium < ActiveRecord::Base
    default_scope{ order('name') }
    
    validates :name, presence: true, length: { maximum: 100 },
        uniqueness: { case_sensitive: false }


    has_many :games
    
end
