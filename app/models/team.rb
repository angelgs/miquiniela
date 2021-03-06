class Team < ActiveRecord::Base
    default_scope{ order('name') }

    validates :name, presence: true, length: { maximum: 50 },
        uniqueness: { case_sensitive: false }

    has_many :games, -> {
      where "team_home_id = #{id} OR team_visitor_id = #{id}" }, :class_name => "Game"

end
