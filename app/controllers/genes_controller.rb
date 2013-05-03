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
    @chips = @gene.get_chips
    @tags = @gene.tags
    @expressions = @gene.get_expressions
    @expressions_hash = @gene.get_expressions_hash(@chips) # to_json maybe...
    @json_gene = @gene.to_json
    @means = @gene.get_means_to_plot
#    @expressions_hash = {}
 #   @chips.each do |chip|
  #    x = {}
   #   ex_array = @gene.get_expressions_by_chip(chip.id)
    #  x[chip] = @gene.parse_expressions(ex_array)
    #  @expressions_hash.merge!(x)
#    end
  end

  def update
    @gene = Gene.find(params[:id])
  end

  def destroy
    @gene = Gene.find(params[:id])
    @gene.destroy
  end

end
