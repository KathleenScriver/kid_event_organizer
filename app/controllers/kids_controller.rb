class KidsController < ApplicationController
  before_action :authorize
  
  def index
    @kids = Kid.all
  end

  def new
    @kid = Kid.new()
  end

  def create
    kid = Kid.create(kid_params)
    redirect_to kid_path(kid)
  end

  def show
    @kid = Kid.find(params[:id])
  end

  private
    def kid_params
      params.require(:kid).permit(:name)
    end
end
