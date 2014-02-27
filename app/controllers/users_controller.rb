class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cheerups_upvoted = @user.cheerup_votes.where(value: 1)
  end
end
