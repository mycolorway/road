require 'spec_helper'

describe "photos/show" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :attachment => "Attachment",
      :story => nil,
      :creator => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Attachment/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
