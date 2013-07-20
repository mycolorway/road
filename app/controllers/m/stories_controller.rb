class M::StoriesController < ApplicationController
  layout '/m/layouts/application'

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
  end

  def by_bounds
    require_params :lat_n, :lng_e, :lat_s, :lng_w

    @stories = Story.by_bounds(params).page params[:page]

    render :index
  end
  
  def show
    @story = Story.find(params[:id])
  end
end
