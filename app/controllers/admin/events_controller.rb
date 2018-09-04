class Admin::EventsController < ApplicationController
  before_action :set_kid
  before_action :authorize

  def new
    @event = Event.new()
  end

  def create
    @event = @kid.events.create(event_params)
    if @event.save
      flash.notice = "Your event was saved!"
      redirect_to admin_kid_path(@kid)
    else
      flash.alert = "There was a problem saving your event. Please try again."
      render :new
    end
  end

  def edit
    @event = @kid.events.find(params[:id])
  end

  def update
    @event = @kid.events.find(params[:id])
    @event.update(event_params)
    if @event.update(event_params)
      flash.notice = "Your event has been updated."
      redirect_to admin_kid_path(@kid)
    else
      flash.alert = "Event was not saved. Please try again."
      render :edit
    end
  end

  def destroy
    @kid.events.delete(params[:id])
    flash.notice = "Event was successfully deleted."
    redirect_to admin_kid_path(@kid)
  end

  private
    def event_params
      params[:event][:time] = Time.parse((params[:event][:time]).to_s)
      params.require(:event).permit(:title, :location, :day_of_week, :time, :description)
    end

    def set_kid
      @kid = Kid.find(params[:kid_id])
    end
end
