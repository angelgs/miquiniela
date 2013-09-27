require 'spec_helper'

describe "games/new" do
  before(:each) do
    assign(:game, stub_model(Game,
      :stadium_id => 1,
      :home_team_id => 1,
      :visitor_team_id => 1
    ).as_new_record)
  end

  it "renders new game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", games_path, "post" do
      assert_select "input#game_stadium_id[name=?]", "game[stadium_id]"
      assert_select "input#game_home_team_id[name=?]", "game[home_team_id]"
      assert_select "input#game_visitor_team_id[name=?]", "game[visitor_team_id]"
    end
  end
end
