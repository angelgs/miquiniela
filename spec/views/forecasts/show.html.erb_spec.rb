require 'spec_helper'

describe "forecasts/show" do
  before(:each) do
    @forecast = assign(:forecast, stub_model(Forecast,
      :user_id => 1,
      :game_id => 2,
      :home_score => 3,
      :visitor_score => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
