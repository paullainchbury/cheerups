# class CheerupVotesController < ApplicationController
#   # GET /cheerup_votes
#   # GET /cheerup_votes.json
#   def index
#     @cheerup_votes = CheerupVote.all

#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @cheerup_votes }
#     end
#   end

#   # GET /cheerup_votes/1
#   # GET /cheerup_votes/1.json
#   def show
#     @cheerup_vote = CheerupVote.find(params[:id])

#     respond_to do |format|
#       format.html # show.html.erb
#       format.json { render json: @cheerup_vote }
#     end
#   end

#   # GET /cheerup_votes/new
#   # GET /cheerup_votes/new.json
#   def new
#     @cheerup_vote = CheerupVote.new

#     respond_to do |format|
#       format.html # new.html.erb
#       format.json { render json: @cheerup_vote }
#     end
#   end

#   # GET /cheerup_votes/1/edit
#   def edit
#     @cheerup_vote = CheerupVote.find(params[:id])
#   end

#   # POST /cheerup_votes
#   # POST /cheerup_votes.json
#   def create
#     @cheerup_vote = CheerupVote.new(params[:cheerup_vote])

#     respond_to do |format|
#       if @cheerup_vote.save
#         format.html { redirect_to @cheerup_vote, notice: 'Cheerup vote was successfully created.' }
#         format.json { render json: @cheerup_vote, status: :created, location: @cheerup_vote }
#       else
#         format.html { render action: "new" }
#         format.json { render json: @cheerup_vote.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PUT /cheerup_votes/1
#   # PUT /cheerup_votes/1.json
#   def update
#     @cheerup_vote = CheerupVote.find(params[:id])

#     respond_to do |format|
#       if @cheerup_vote.update_attributes(params[:cheerup_vote])
#         format.html { redirect_to @cheerup_vote, notice: 'Cheerup vote was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @cheerup_vote.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /cheerup_votes/1
#   # DELETE /cheerup_votes/1.json
#   def destroy
#     @cheerup_vote = CheerupVote.find(params[:id])
#     @cheerup_vote.destroy

#     respond_to do |format|
#       format.html { redirect_to cheerup_votes_url }
#       format.json { head :no_content }
#     end
#   end
# end
