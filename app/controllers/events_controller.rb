class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @current_user = current_user
    @event = Event.new
    @event.creator_id = @current_user.id
    @event.name = post_params[:name]
    @event.date = post_params[:date]
    @event.address = post_params[:address]
    @event.description = post_params[:description]

    if @event.save
      redirect_to root_path
    else
      render :new, status: unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:event).permit(:name, :date, :address, :description)
  end
end