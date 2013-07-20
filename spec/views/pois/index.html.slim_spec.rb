require 'spec_helper'

describe "pois/index" do
  before(:each) do
    assign(:pois, [
      stub_model(Poi),
      stub_model(Poi)
    ])
  end

  it "renders a list of pois" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
