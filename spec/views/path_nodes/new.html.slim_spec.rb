require 'spec_helper'

describe "path_nodes/new" do
  before(:each) do
    assign(:path_node, stub_model(PathNode).as_new_record)
  end

  it "renders new path_node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => path_nodes_path, :method => "post" do
    end
  end
end
