class StoriesController < ApplicationController
  before_filter :authenticate_user!, only: [:by_user, :create, :update]

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

  def by_keyword
    require_params :q

    @stories = Story.by_keyword(params[:q]).page params[:page]

    render :index
  end

  def by_user
    @stories = User.find(params[:user_id]).stories

    render :index
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])
  end

  # GET /stories/new
  # GET /stories/new.json
  #def new
    #@story = Story.new

    #respond_to do |format|
      #format.html # new.html.erb
      #format.json { render json: @story }
    #end
  #end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story].merge creator: current_user)

    if @story.save
      params[:path_nodes].each do |path_node_params|
        @story.path_nodes.create path_node_params
      end

      respond_to do |format|
        format.html { redirect_to @story }
        format.json { render action: :show, status: :created, location: @story }
      end
    else
      respond_to do |format|
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        #format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  #def destroy
    #@story = Story.find(params[:id])
    #@story.destroy

    #respond_to do |format|
      #format.html { redirect_to stories_url }
      #format.json { head :no_content }
    #end
  #end
end
