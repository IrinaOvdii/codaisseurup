class RegistrationsController < ApplicationController
  before_action :load_event
  belongs_to :user, optional: true

  def create
    @registration = current_user.registrations.create(registration_params.merge({
     event:  @event }))

    redirect_to @registration.event, notice: "Thank you for registration!"
  end

  private

  def registration_params
    params.require(:registration).permit(:status, :guest_count)
  end

  def load_event
    @event = Event.find(params[:event_id])
  end
end
end
