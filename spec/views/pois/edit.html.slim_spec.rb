require 'spec_helper'

describe "pois/edit" do
  before(:each) do
    @poi = assign(:poi, stub_model(Poi))
  end

  it "renders the edit poi form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pois_path(@poi), :method => "post" do
    end
  end
end
