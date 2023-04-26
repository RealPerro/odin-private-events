class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @created = Event.where(creator_id: @user.id)
  end

  private
  
  def post_params
    params.require(:event).permit(:name, :date, :address, :description)
  end
end