class GeoPointsController < ApplicationController
  # GET /geo_points
  # GET /geo_points.json
  def index
    @geo_points = GeoPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @geo_points }
    end
  end

  # GET /geo_points/1
  # GET /geo_points/1.json
  def show
    @geo_point = GeoPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @geo_point }
    end
  end

  # GET /geo_points/new
  # GET /geo_points/new.json
  def new
    @geo_point = GeoPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @geo_point }
    end
  end

  # GET /geo_points/1/edit
  def edit
    @geo_point = GeoPoint.find(params[:id])
  end

  # POST /geo_points
  # POST /geo_points.json
  def create
    @geo_point = GeoPoint.new(params[:geo_point])

    respond_to do |format|
      if @geo_point.save
        format.html { redirect_to @geo_point, notice: 'Geo point was successfully created.' }
        format.json { render json: @geo_point, status: :created, location: @geo_point }
      else
        format.html { render action: "new" }
        format.json { render json: @geo_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /geo_points/1
  # PUT /geo_points/1.json
  def update
    @geo_point = GeoPoint.find(params[:id])

    respond_to do |format|
      if @geo_point.update_attributes(params[:geo_point])
        format.html { redirect_to @geo_point, notice: 'Geo point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @geo_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geo_points/1
  # DELETE /geo_points/1.json
  def destroy
    @geo_point = GeoPoint.find(params[:id])
    @geo_point.destroy

    respond_to do |format|
      format.html { redirect_to geo_points_url }
      format.json { head :no_content }
    end
  end
end
