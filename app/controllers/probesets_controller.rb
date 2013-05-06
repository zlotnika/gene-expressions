class ProbesetsController < ApplicationController
  def index
    @probesets = Probeset.all
  end
  
  def show
    @probeset = Probeset.find(params[:id])
    @data = @probeset.get_means
  end

  def new
  end
end
