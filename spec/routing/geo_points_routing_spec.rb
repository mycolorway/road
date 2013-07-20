require "spec_helper"

describe GeoPointsController do
  describe "routing" do

    it "routes to #index" do
      get("/geo_points").should route_to("geo_points#index")
    end

    it "routes to #new" do
      get("/geo_points/new").should route_to("geo_points#new")
    end

    it "routes to #show" do
      get("/geo_points/1").should route_to("geo_points#show", :id => "1")
    end

    it "routes to #edit" do
      get("/geo_points/1/edit").should route_to("geo_points#edit", :id => "1")
    end

    it "routes to #create" do
      post("/geo_points").should route_to("geo_points#create")
    end

    it "routes to #update" do
      put("/geo_points/1").should route_to("geo_points#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/geo_points/1").should route_to("geo_points#destroy", :id => "1")
    end

  end
end
