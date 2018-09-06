class Event < ApplicationRecord
  validates_presence_of :title, :location, :day_of_week, :time
  belongs_to :kid

  def self.sorted_events(scope)
    events = Event.where(kid_id: scope)
    mon = events.where(day_of_week: "Monday")
    tues = events.where(day_of_week: "Tuesday")
    wed = events.where(day_of_week: "Wednesday")
    thur = events.where(day_of_week: "Thursday")
    fri = events.where(day_of_week: "Friday")
    sat = events.where(day_of_week: "Saturday")
    sun = events.where(day_of_week: "Sunday")
    [mon, tues, wed, thur, fri, sat, sun]
  end
end
