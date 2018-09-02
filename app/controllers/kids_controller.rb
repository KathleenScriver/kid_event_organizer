class KidsController < ApplicationController
  before_action :authorize, only: [:index, :show]

  def index
    @kids = current_user.kids
  end

  def show
    @kid = Kid.find(params[:id])
  end
end
