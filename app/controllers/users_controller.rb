class UsersController < ApplicationController
  def create
    @total_score = User.find(params[:username]).calculate.total_score
    render :new
  end
end
