require 'spec_helper'

describe "pois/new" do
  before(:each) do
    assign(:poi, stub_model(Poi).as_new_record)
  end

  it "renders new poi form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pois_path, :method => "post" do
    end
  end
end
