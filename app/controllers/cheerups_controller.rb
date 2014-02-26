class CheerupsController < ApplicationController
  load_and_authorize_resource

  # GET /cheerups
  # GET /cheerups.json
  def index
    @cheerups = Cheerup.order(:created_at).page(params[:page])
    # order(:created_at).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cheerups }
    end
  end

  # GET /cheerups/1
  # GET /cheerups/1.json
  def show
    @cheerup = Cheerup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cheerup }
    end
  end

  # GET /cheerups/new
  # GET /cheerups/new.json
  def new
    @cheerup = Cheerup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cheerup }
    end
  end

  # GET /cheerups/1/edit
  def edit
    @cheerup = Cheerup.find(params[:id])
  end

  # POST /cheerups
  # POST /cheerups.json
  def create
    @cheerup = Cheerup.new(params[:cheerup])
    @cheerup.user = current_user
    @cheerup.cheerpoints = 0
    #binding.pry

    respond_to do |format|
      if @cheerup.save
        format.html { redirect_to @cheerup, notice: 'Cheerup was successfully created.' }
        format.json { render json: @cheerup, status: :created, location: @cheerup }
      else
        format.html { render action: "new" }
        format.json { render json: @cheerup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cheerups/1
  # PUT /cheerups/1.json
  def update
    @cheerup = Cheerup.find(params[:id])

    respond_to do |format|
      if @cheerup.update_attributes(params[:cheerup])
        format.html { redirect_to @cheerup, notice: 'Cheerup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cheerup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheerups/1
  # DELETE /cheerups/1.json
  def destroy
    @cheerup = Cheerup.find(params[:id])
    @cheerup.destroy

    respond_to do |format|
      format.html { redirect_to cheerups_url }
      format.json { head :no_content }
    end
  end

  def flag
    @cheerup = Cheerup.find(params[:id])
    if current_user.flagged?(@cheerup, :inappropriate)
      #user has already flagged the cheerup
       current_user.unflag(@cheerup, :inappropriate)
       msg = "You have unflagged this cheerup"
     else
      #user hasn't flagged the cheerup yet
       current_user.flag(@cheerup, :inappropriate)
       msg = "You have flagged this cheerup"
     end
    redirect_to @cheerup, notice: msg

  end


end





