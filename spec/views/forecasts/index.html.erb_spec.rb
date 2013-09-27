require 'spec_helper'

describe "forecasts/index" do
  before(:each) do
    assign(:forecasts, [
      stub_model(Forecast,
        :user_id => 1,
        :game_id => 2,
        :home_score => 3,
        :visitor_score => 4
      ),
      stub_model(Forecast,
        :user_id => 1,
        :game_id => 2,
        :home_score => 3,
        :visitor_score => 4
      )
    ])
  end

  it "renders a list of forecasts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
