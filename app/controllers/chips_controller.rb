class ChipsController < ApplicationController
  def index
    @chips = Chip.all
  end
  
  def show
    @chip = Chip.find(params[:id])
    @data = @chip.get_means
  end

  def new
  end
end
