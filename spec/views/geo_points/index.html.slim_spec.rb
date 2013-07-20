require 'spec_helper'

describe "geo_points/index" do
  before(:each) do
    assign(:geo_points, [
      stub_model(GeoPoint,
        :latitude => "9.99",
        :longitude => "9.99",
        :elevation => "",
        :story => nil,
        :creator => nil
      ),
      stub_model(GeoPoint,
        :latitude => "9.99",
        :longitude => "9.99",
        :elevation => "",
        :story => nil,
        :creator => nil
      )
    ])
  end

  it "renders a list of geo_points" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
