class GenesController < ApplicationController
  def index
    @genes = Gene.all
    @tissues = Tissue.all
    @values = Value.all
    @chips = Chip.all
    @values_relevant = Value.meaningful
    @cool_genes = Gene.search(params[:search])
#    @gene = Gene.find(params[:id])
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