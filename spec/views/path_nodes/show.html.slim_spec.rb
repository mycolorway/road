require 'spec_helper'

describe "path_nodes/show" do
  before(:each) do
    @path_node = assign(:path_node, stub_model(PathNode))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
