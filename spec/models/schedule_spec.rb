require 'spec_helper'

describe Schedule do
  before {
    season = Season.create(:name => 'Torneo Apertura 2013',
                          :start_at => Date.today,
                          :end_at => Date.today + 90)

      @schedule = Schedule.new(:season => season,
                              :name => 'Jornada 1',
                              :start_at => Date.today + 10,
                              :end_at => Date.today + 13)
  }

  subject { @schedule }

    it { should respond_to(:season_id) }
    it { should respond_to(:name) }
    it { should respond_to(:start_at) }
    it { should respond_to(:end_at) }

    it { should be_valid }

    describe "when name is not present" do
        before { @schedule.name = " " }
        it { should_not be_valid }
    end

    describe "when name is too long" do
        before { @schedule.name = "a" * 101 }
        it { should_not be_valid }
    end

    describe "when name already exist" do
        before do
            schedule_same_name = @schedule.dup
            schedule_same_name.name = @schedule.name.upcase
            schedule_same_name.save
        end
        it { should_not be_valid }
    end

    describe "when start date is not present " do
        before {@schedule.start_at = nil}
        it { should_not be_valid }
    end

    describe "when end date is not present " do
        before {@schedule.end_at = nil}
        it { should_not be_valid }
    end

    describe "when start date is before today" do
        before { @schedule.start_at = Date.today - 1}
        it { should_not be_valid }
    end

    describe "when end date is before start date" do
        before { @schedule.end_at = '2013-07-10'}
        it { should_not be_valid }
    end

end
