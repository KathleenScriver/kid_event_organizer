class Event < ApplicationRecord
  validates_presence_of :title, :location, :day_of_week, :time
  belongs_to :kid
end
