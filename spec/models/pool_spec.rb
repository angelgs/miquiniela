require 'spec_helper'

describe Pool do
  before {
    user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    season = Season.create(name: 'Torneo Apertura 2013', start_at: Date.today, end_at: Date.today + 90)
    schedule = Schedule.create(season: season, name: 'Jornada 1', start_at: Date.today + 1, end_at: Date.today + 4)
    stadium = Stadium.create(name: 'Luis Pirata Fuente')
    team_home = Team.create(name: 'Tiburones Rojos de Veracruz')
    team_visitor = Team.create(name: 'Jaguares de Chiapas')
    game = Game.new(start_at: schedule.start_at + 1, stadium: stadium, schedule: schedule, team_home: team_home, team_visitor: team_visitor)    
    @pool = Pool.new(name: 'Torneo apertura 2013 - Jornada 1', schedule: schedule)
  }
  
  subject { @pool }
end
