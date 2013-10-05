require 'spec_helper'

describe Stadium do
    before { @stadium = Stadium.new(:name => "Luis Pirata Fuente")}

    subject{ @stadium }

    it { should respond_to(:name) }
    it { should be_valid }

    describe "when name is not present" do
        before { @stadium.name = " " }
        it { should_not be_valid }
    end

    describe "when name is too long" do
        before { @stadium.name = "a" * 101 }
        it { should_not be_valid }
    end

    describe "when name already exist" do
        before do
            stadium_same_name = @stadium.dup
            stadium_same_name.name = @stadium.name.upcase
            stadium_same_name.save
        end
        it { should_not be_valid }
    end
        
end
