class User < ApplicationRecord
  validates_presence_of :name, :title
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  has_many :user_kids, dependent: :destroy
  has_many :kids, through: :user_kids
  has_secure_password
  enum role: %w(default admin)
end
