class GamesController < ApplicationController
  def index
    @games = Game.includes(:platform, :publisher).all.limit(10)

    puts @sales.inspect
  end

  def show
    @game = Game.find(params[:id])
    @sales = Sale.includes(:games_sales, :game).all
  end

  def search
    wildcard_search = "%#{params[:keyword]}%"
    genre = params[:genre]
    @games = Game.where("name LIKE ?", wildcard_search).where(genre:)
  end
end
