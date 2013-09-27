class Team < ActiveRecord::Base
    default_scope{ order('name') }
    
    validates :name, presence: true, length: { maximum: 50 },
        uniqueness: { case_sensitive: false }

    has_many :games, :class_name => "Game", :finder_sql => Proc.new {
        %Q{
            SELECT DISTINCT games.* FROM games WHERE (team_home_id = #{id} OR team_visitor_id = #{id}) ORDER BY start_at DESC
        }
    }
    
end
