require "spec_helper"

describe PathNodesController do
  describe "routing" do

    it "routes to #index" do
      get("/path_nodes").should route_to("path_nodes#index")
    end

    it "routes to #new" do
      get("/path_nodes/new").should route_to("path_nodes#new")
    end

    it "routes to #show" do
      get("/path_nodes/1").should route_to("path_nodes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/path_nodes/1/edit").should route_to("path_nodes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/path_nodes").should route_to("path_nodes#create")
    end

    it "routes to #update" do
      put("/path_nodes/1").should route_to("path_nodes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/path_nodes/1").should route_to("path_nodes#destroy", :id => "1")
    end

  end
end
