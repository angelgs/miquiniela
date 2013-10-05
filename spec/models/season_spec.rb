require 'spec_helper'

describe Season do

  before { @season = Season.new(:name => 'Torneo 7 liga MX',
                                :start_at => Date.today,
                                :end_at => Date.today + 60)
  }


  subject { @season}

    it { should respond_to(:name) }
    it { should respond_to(:start_at) }
    it { should respond_to(:end_at) }

    it { should be_valid }

    describe "when name is not present" do
        before { @season.name = "" }
        it { should_not be_valid }
    end

    describe "when name is too long" do
        before { @season.name = "a" * 101 }
        it { should_not be_valid }
    end

    describe "when name already exist" do
        before do
            season_same_name = @season.dup
            season_same_name.name = @season.name.upcase
            season_same_name.save
        end
        it { should_not be_valid }
    end

    describe "when start date is not present " do
        before {@season.start_at = nil}
        it { should_not be_valid }
    end

    describe "when end date is not present " do
        before {@season.end_at = nil}
        it { should_not be_valid }
    end

    describe "when start date is before today" do
        before { @season.start_at = Date.today - 1}
        it { should_not be_valid }
    end

    describe "when end date is before start date" do
        before { @season.end_at = '2013-07-10'}
        it { should_not be_valid }
    end

end
