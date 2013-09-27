require 'spec_helper'

describe "stadia/index" do
  before(:each) do
    assign(:stadia, [
      stub_model(Stadium,
        :name => "Name"
      ),
      stub_model(Stadium,
        :name => "Name"
      )
    ])
  end

  it "renders a list of stadia" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
