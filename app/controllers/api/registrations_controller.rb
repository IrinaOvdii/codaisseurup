class Api::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_event

  def create
    registration = @event.registrations.new(registration_params)

    if registration.save
      render status: 200, json: {
        message: "Registration successfully created",
        event: @event,
        registration: registration
      }.to_json
    else
      render status: 422, json: {
        message: "Registration could not be created",
        errors: registration.errors
      }.to_json
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def registration_params
    params.require(:registration).permit(:status, :guest_count)
  end
end
