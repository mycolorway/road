require "spec_helper"

describe PoisController do
  describe "routing" do

    it "routes to #index" do
      get("/pois").should route_to("pois#index")
    end

    it "routes to #new" do
      get("/pois/new").should route_to("pois#new")
    end

    it "routes to #show" do
      get("/pois/1").should route_to("pois#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pois/1/edit").should route_to("pois#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pois").should route_to("pois#create")
    end

    it "routes to #update" do
      put("/pois/1").should route_to("pois#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pois/1").should route_to("pois#destroy", :id => "1")
    end

  end
end
