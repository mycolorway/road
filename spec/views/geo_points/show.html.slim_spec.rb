require 'spec_helper'

describe "geo_points/show" do
  before(:each) do
    @geo_point = assign(:geo_point, stub_model(GeoPoint,
      :latitude => "9.99",
      :longitude => "9.99",
      :elevation => "",
      :story => nil,
      :creator => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
