class TissueController < ApplicationController
  def index
    @tissues = Tissue.all
  end

  def new
    @tissue = Tissue.find_by_id(params[:id])
  end
end
