class EventsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @events = current_user.events
  end

  def show; end

  def new
    @room = current_user.events.build
  end

  def create
    @room = current_user.events.build(room_params)

    if @room.save
      redirect_to @room, notice: "Room created"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Room updated"
    else
      render :edit
    end
  end

  private

  def set_event
    @event = Room.find(params[:id])
  end

  def event_params
    params
      .require(:event)
      .permit(
        :name, :description, :location, :price, :capacity, :includes_food, :includes_drinks, :starts_at, :ends_at, :active )
      )
  end
end
