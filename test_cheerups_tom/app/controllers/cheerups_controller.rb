class CheerupsController < ApplicationController
  # GET /cheerups
  def index
    @cheerups = Cheerup.by_votes

  end

  # GET /cheerups/1
  def show
    @cheerup = Cheerup.find(params[:id])

  end

  # POST /cheerups
  def create
    @cheerup = current_user.cheerups.create!(params[:cheerup])
    redirect_to @cheerup, notice: 'Cheerup was successfully created.'
  end

  def vote
    vote = current_user.cheerup_votes.new(value: params[:value], cheerup_id: params[:id])
    if vote.save
      redirect_to :back, notice: "Thank you for voting."
    else
      redirect_to :back, alert: "Unable to vote, perhaps you already did."
    end    
  end
end
