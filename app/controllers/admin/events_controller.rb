class Admin::EventsController < ApplicationController
  def new
    @kid = Kid.find(params[:kid_id])
    @event = Event.new()
  end

  def create
    @kid = Kid.find(params[:kid_id])
    @event = @kid.events.new(event_params)
    if @event.save
      flash.notice = "Your event was saved!"
      redirect_to admin_kid_path(@kid)
    else
      flash.alert = "There was a problem saving your event. Please try again."
      render :new
    end
  end

  private
    def event_params
      params[:event][:time] = Time.parse(params[:event][:time])
      params.require(:event).permit(:title, :location, :day_of_week, :time, :description)
    end
end
