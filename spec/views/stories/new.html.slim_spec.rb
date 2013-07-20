require 'spec_helper'

describe "stories/new" do
  before(:each) do
    assign(:story, stub_model(Story,
      :title => "MyString",
      :body => "MyText",
      :creator => nil
    ).as_new_record)
  end

  it "renders new story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stories_path, :method => "post" do
      assert_select "input#story_title", :name => "story[title]"
      assert_select "textarea#story_body", :name => "story[body]"
      assert_select "input#story_creator", :name => "story[creator]"
    end
  end
end
