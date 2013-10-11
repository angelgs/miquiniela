require 'spec_helper'

describe Pool do

  let(:user) { FactoryGirl.create(:user) }

  before {
    @pool = user.pools.build(name: 'Torneo apertura 2013 - Jornada 1' )
  }

  subject { @pool }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  it { should respond_to(:games) }


  it { should be_valid }

  describe "when user is not present" do
    before { @pool.user = nil}
    it { should_not be_valid }
  end

  describe "when name is not present" do
      before { @pool.name = "" }
      it { should_not be_valid }
  end

  describe "when name is too long" do
      before { @pool.name = "a" * 101 }
      it { should_not be_valid }
  end

  describe "when name already exist" do
      before do
          pool_same_name = @pool.dup
          pool_same_name.name = @pool.name.upcase
          pool_same_name.save
      end
      it { should_not be_valid }
  end

end
