require 'spec_helper'

describe "path_nodes/edit" do
  before(:each) do
    @path_node = assign(:path_node, stub_model(PathNode))
  end

  it "renders the edit path_node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => path_nodes_path(@path_node), :method => "post" do
    end
  end
end
