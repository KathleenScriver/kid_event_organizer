class Admin::KidsController < ApplicationController
  def index
    @kids = Kid.all
  end
end
