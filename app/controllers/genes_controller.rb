class GenesController < ApplicationController
  def index
    @genes = Gene.all
    @tissues = Tissue.all
    @expressions = Expression.all
    @chips = Chip.all
    @expressions_relevant = Expression.meaningful
    @found_genes = Gene.search(params[:search])
  end

  def new
    @gene = Gene.new
  end

  def show
    @gene = Gene.find(params[:id])
    @chips = @gene.get_chips
    @expressions = @gene.get_expressions
    @expressions_hash = @gene.get_expressions_hash(@chips) # to_json maybe...
    @means = @gene.get_means_to_plot
  end

  def update
    @gene = Gene.find(params[:id])
  end

  def destroy
    @gene = Gene.find(params[:id])
    @gene.destroy
  end

end
