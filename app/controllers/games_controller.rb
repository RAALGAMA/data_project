class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform, :publisher).all.limit(1000)
    @sales = Sale.includes(:games_sales, :game).all

    puts @sales.inspect
  end

  def show
    @game = Game.find(params[:id])
  end
end