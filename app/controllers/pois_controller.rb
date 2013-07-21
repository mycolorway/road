class PoisController < ApplicationController
  #before_filter :authenticate_user!, only: [:create, :update]
  before_filter :fake_auth!, only: [:create, :update]

  # GET /pois
  # GET /pois.json
  def index
    @pois = Poi.all
  end

  # GET /pois/1
  # GET /pois/1.json
  def show
    @poi = Poi.find(params[:id])
  end

  # GET /pois/new
  # GET /pois/new.json
  #def new
    #@poi = Poi.new

    #respond_to do |format|
      #format.html # new.html.erb
      #format.json { render json: @poi }
    #end
  #end

  # GET /pois/1/edit
  #def edit
    #@poi = Poi.find(params[:id])
  #end

  # POST /pois
  # POST /pois.json
  def create
    @story = Story.find(params[:story_id])
    @poi = Poi.new(title: params[:title],
                   description: params[:description],
                   latitude: params[:latitude],
                   longitude: params[:longitude],
                   baidu_lat: params[:latitude],
                   baidu_lng: params[:longitude],
                   subtype: params[:subtype],
                   story: @story,
                   elevation: 0,
                   creator: current_user)

    #respond_to do |format|
      if @poi.save
        #format.html { redirect_to @poi, notice: 'Poi was successfully created.' }
        #format.json { render json: @poi, status: :created, location: @poi }
        render json: @poi, status: :created, location: @poi
      else
        #format.html { render action: "new" }
        #format.json { render json: @poi.errors, status: :unprocessable_entity }
        render json: @poi.errors, status: :unprocessable_entity
      end
    #end
  end

  # PUT /pois/1
  # PUT /pois/1.json
  def update
    @poi = Poi.find(params[:id])

    respond_to do |format|
      if @poi.update_attributes(params[:poi])
        format.html { redirect_to @poi, notice: 'Poi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pois/1
  # DELETE /pois/1.json
  #def destroy
    #@poi = Poi.find(params[:id])
    #@poi.destroy

    #respond_to do |format|
      #format.html { redirect_to pois_url }
      #format.json { head :no_content }
    #end
  #end
end
