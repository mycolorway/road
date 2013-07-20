require 'spec_helper'

describe "pois/show" do
  before(:each) do
    @poi = assign(:poi, stub_model(Poi))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
