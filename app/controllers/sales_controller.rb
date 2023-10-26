class SalesController < ApplicationController
  def index
    @sales = Sale.all.limit(10)
  end

  def show
    @sale = Sale.find(params[:id])
  end
end
