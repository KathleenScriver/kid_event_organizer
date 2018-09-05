class EventsController < ApplicationController
  before_action :authorize

  def index
    @sorted_events = Event.sorted_days
  end
end
