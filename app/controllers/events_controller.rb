class EventsController < ApplicationController
  before_action :authorize

  def index
    kid_ids = current_user.event_scope
    @sorted_events = Event.sorted_events(kid_ids)
  end
end
