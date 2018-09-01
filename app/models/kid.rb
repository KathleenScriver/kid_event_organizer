class Kid < ApplicationRecord
  validates_presence_of :name
  has_many :user_kids
  has_many :users, through: :user_kids
end
