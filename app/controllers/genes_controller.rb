class GenesController < ApplicationController
  def index
    @genes = Gene.all
    @tissues = Tissue.all
    @values = Values.all
    @chips = Chip.all
  end

  def new
    @gene = Gene.new
  end

  def show
    @gene = Gene.find(params[:id])
  end

  def update
    @gene = Gene.find(params[:id])
  end

  def destroy
    @gene = Gene.find(params[:id])
    @gene.destroy
  end

end
