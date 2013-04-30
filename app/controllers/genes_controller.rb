class GenesController < ApplicationController
  def index
    @genes = Gene.all
    @tissues = Tissue.all
    @expressions = Expression.all
    @chips = Chip.all
    @expressions_relevant = Expression.meaningful
    @found_genes = Gene.search(params[:search])
#    @gene = Gene.find(params[:id])
  end

  def new
    @gene = Gene.new
  end

  def show
    @gene = Gene.find(params[:id])
    @expressions = @gene.get_expressions
  end

  def update
    @gene = Gene.find(params[:id])
  end

  def destroy
    @gene = Gene.find(params[:id])
    @gene.destroy
  end

end
