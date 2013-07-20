require 'spec_helper'

describe "photos/new" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :attachment => "MyString",
      :story => nil,
      :creator => nil
    ).as_new_record)
  end

  it "renders new photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photos_path, :method => "post" do
      assert_select "input#photo_attachment", :name => "photo[attachment]"
      assert_select "input#photo_story", :name => "photo[story]"
      assert_select "input#photo_creator", :name => "photo[creator]"
    end
  end
end
