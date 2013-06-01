class GenesController < ApplicationController
  
  respond_to :json

  def index
    respond_to do |format|
      format.html
      format.json { render json: Gene.all }
      @tissues = Tissue.all
      @expressions = Expression.all
      @probesets = Probeset.all
      @expressions_relevant = Expression.meaningful
      @found_genes = Gene.search(params[:search])
    end
  end

  def new
    @gene = Gene.new
  end

  def show
    @gene = Gene.find(params[:id])
    @probesets = @gene.get_probesets
    @tags = @gene.tags
    @expressions = @gene.get_expressions
    @expressions_hash = @gene.get_expressions_hash(@probesets) # to_json maybe...
    @json_gene = @gene.to_json
    @means = @gene.get_means_to_plot
#    @expressions_hash = {}
 #   @probesets.each do |probeset|
  #    x = {}
   #   ex_array = @gene.get_expressions_by_probeset(probeset.id)
    #  x[probeset] = @gene.parse_expressions(ex_array)
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
