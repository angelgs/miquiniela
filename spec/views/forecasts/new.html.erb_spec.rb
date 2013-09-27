require 'spec_helper'

describe "forecasts/new" do
  before(:each) do
    assign(:forecast, stub_model(Forecast,
      :user_id => 1,
      :game_id => 1,
      :home_score => 1,
      :visitor_score => 1
    ).as_new_record)
  end

  it "renders new forecast form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", forecasts_path, "post" do
      assert_select "input#forecast_user_id[name=?]", "forecast[user_id]"
      assert_select "input#forecast_game_id[name=?]", "forecast[game_id]"
      assert_select "input#forecast_home_score[name=?]", "forecast[home_score]"
      assert_select "input#forecast_visitor_score[name=?]", "forecast[visitor_score]"
    end
  end
end
