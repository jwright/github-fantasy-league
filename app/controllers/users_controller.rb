class UsersController < ApplicationController
  def create
    render :json => User.find(params[:username]).calculate
  end
end
