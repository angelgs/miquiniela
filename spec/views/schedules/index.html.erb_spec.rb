require 'spec_helper'

describe "schedules/index" do
  before(:each) do
    assign(:schedules, [
      stub_model(Schedule,
        :number => "Number"
      ),
      stub_model(Schedule,
        :number => "Number"
      )
    ])
  end

  it "renders a list of schedules" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
  end
end
