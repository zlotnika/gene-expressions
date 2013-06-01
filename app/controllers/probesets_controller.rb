class ProbesetsController < ApplicationController
  
  respond_to :json

  def index
    respond_to do |format|
      format.html
      format.json { render json: Probeset.all }
    end
  end
  
  def show
    @probeset = Probeset.find(params[:id])
    @data = @probeset.get_means
  end

  def new
  end
end
