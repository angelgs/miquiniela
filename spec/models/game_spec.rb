require 'spec_helper'

describe Game do
  before {
    season = Season.create(:name => 'Torneo Apertura 2013', :start_at => Date.today, :end_at => Date.today + 90)
    schedule = Schedule.create(:season => season, :name => 'Jornada 1', :start_at => Date.today + 1, :end_at => Date.today + 4)
    stadium = Stadium.create(:name => 'Luis Pirata Fuente')
    team_home = Team.create(:name => 'Tiburones Rojos de Veracruz')
    team_visitor = Team.create(:name => 'Jaguares de Chiapas')
    @game = Game.new(:start_at => DateTime.now + 1, :stadium => stadium, :schedule => schedule, :team_home => team_home, :team_visitor => team_visitor)
  }

  subject { @game }


  it { should respond_to(:start_at) }
  it { should respond_to(:stadium) }
  it { should respond_to(:schedule) }
  it { should respond_to(:team_home) }
  it { should respond_to(:team_visitor) }


  it { should be_valid }

  describe "when start date is not present" do
      before {@game.start_at = nil}
      it { should_not be_valid }
  end

  describe "when start date is before schedule start" do
      before { @game.start_at = @game.schedule_start_at - 1 }
      it { should_not be_valid }
  end

  describe "when start date is after schedule end" do
      before { @game.start_at = @game.schedule_end_at + 1 }
      it { should_not be_valid }
  end

  describe "when stadium is not present" do
    before { @game.stadium = nil}
    it { should_not be_valid }
  end

  describe "when schedule is not present" do
    before { @game.schedule = nil}
    it { should_not be_valid }
  end
  
  describe "when team home is not present" do
    before { @game.team_home = nil}
    it { should_not be_valid }
  end

  describe "when team visitor is or present" do
    before { @game.team_visitor = nil}
    it { should_not be_valid }
  end

end
