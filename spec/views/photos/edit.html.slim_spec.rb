require 'spec_helper'

describe "photos/edit" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :attachment => "MyString",
      :story => nil,
      :creator => nil
    ))
  end

  it "renders the edit photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photos_path(@photo), :method => "post" do
      assert_select "input#photo_attachment", :name => "photo[attachment]"
      assert_select "input#photo_story", :name => "photo[story]"
      assert_select "input#photo_creator", :name => "photo[creator]"
    end
  end
end
