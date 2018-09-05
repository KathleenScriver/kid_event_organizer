class Event < ApplicationRecord
  validates_presence_of :title, :location, :day_of_week, :time
  belongs_to :kid

  def self.sorted_days
    mon = Event.where(day_of_week: "Monday")
    tues = Event.where(day_of_week: "Tuesday")
    wed = Event.where(day_of_week: "Wednesday")
    thur = Event.where(day_of_week: "Thursday")
    fri = Event.where(day_of_week: "Friday")
    sat = Event.where(day_of_week: "Saturday")
    sun = Event.where(day_of_week: "Sunday")
    [mon, tues, wed, thur, fri, sat, sun]
  end
end
