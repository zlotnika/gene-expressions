class GenesController < ApplicationController
  def index
    @genes = Gene.all
  end

  def new
    @gene = Gene.new
  end

  def show
    @genes = Gene.find(params[:id])
  end

  def update
    @gene = Gene.find(params[:id])
  end

  def destroy
    @gene = Gene.find(params[:id])
    @gene.destroy
  end

end
