require 'spec_helper'

describe "path_nodes/index" do
  before(:each) do
    assign(:path_nodes, [
      stub_model(PathNode),
      stub_model(PathNode)
    ])
  end

  it "renders a list of path_nodes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
