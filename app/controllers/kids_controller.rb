class KidsController < ApplicationController
  before_action :authorize

  def index
    @kids = Kid.all
  end

  def show
    @kid = Kid.find(params[:id])
  end
end
