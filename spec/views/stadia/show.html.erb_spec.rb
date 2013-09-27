require 'spec_helper'

describe "stadia/show" do
  before(:each) do
    @stadium = assign(:stadium, stub_model(Stadium,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
