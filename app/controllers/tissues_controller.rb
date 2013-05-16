class TissuesController < ApplicationController
  
  respond_to :json # this is required to make the angular-resource work.  otherwise it doesn't get the Tissues in a way it likes

  def index
    respond_to do |format|
      format.html
      format.json { render json: Tissue.all }
    end
  end

  def new
    @tissue = Tissue.find_by_id(params[:id])
  end
end
