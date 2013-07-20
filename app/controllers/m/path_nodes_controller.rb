class M::PathNodesController < ApplicationController
  # GET /path_nodes
  # GET /path_nodes.json
  def index
    @path_nodes = PathNode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @path_nodes }
    end
  end

  # GET /path_nodes/1
  # GET /path_nodes/1.json
  def show
    @path_node = PathNode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @path_node }
    end
  end

  # GET /path_nodes/new
  # GET /path_nodes/new.json
  def new
    @path_node = PathNode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @path_node }
    end
  end

  # GET /path_nodes/1/edit
  def edit
    @path_node = PathNode.find(params[:id])
  end

  # POST /path_nodes
  # POST /path_nodes.json
  def create
    @path_node = PathNode.new(params[:path_node])

    respond_to do |format|
      if @path_node.save
        format.html { redirect_to @path_node, notice: 'Path node was successfully created.' }
        format.json { render json: @path_node, status: :created, location: @path_node }
      else
        format.html { render action: "new" }
        format.json { render json: @path_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /path_nodes/1
  # PUT /path_nodes/1.json
  def update
    @path_node = PathNode.find(params[:id])

    respond_to do |format|
      if @path_node.update_attributes(params[:path_node])
        format.html { redirect_to @path_node, notice: 'Path node was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @path_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /path_nodes/1
  # DELETE /path_nodes/1.json
  def destroy
    @path_node = PathNode.find(params[:id])
    @path_node.destroy

    respond_to do |format|
      format.html { redirect_to path_nodes_url }
      format.json { head :no_content }
    end
  end
end
