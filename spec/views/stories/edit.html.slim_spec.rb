require 'spec_helper'

describe "stories/edit" do
  before(:each) do
    @story = assign(:story, stub_model(Story,
      :title => "MyString",
      :body => "MyText",
      :creator => nil
    ))
  end

  it "renders the edit story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stories_path(@story), :method => "post" do
      assert_select "input#story_title", :name => "story[title]"
      assert_select "textarea#story_body", :name => "story[body]"
      assert_select "input#story_creator", :name => "story[creator]"
    end
  end
end
