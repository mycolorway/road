require 'spec_helper'

describe "geo_points/new" do
  before(:each) do
    assign(:geo_point, stub_model(GeoPoint,
      :latitude => "9.99",
      :longitude => "9.99",
      :elevation => "",
      :story => nil,
      :creator => nil
    ).as_new_record)
  end

  it "renders new geo_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => geo_points_path, :method => "post" do
      assert_select "input#geo_point_latitude", :name => "geo_point[latitude]"
      assert_select "input#geo_point_longitude", :name => "geo_point[longitude]"
      assert_select "input#geo_point_elevation", :name => "geo_point[elevation]"
      assert_select "input#geo_point_story", :name => "geo_point[story]"
      assert_select "input#geo_point_creator", :name => "geo_point[creator]"
    end
  end
end
