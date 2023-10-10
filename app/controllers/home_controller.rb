class HomeController < ApplicationController
  def index
    @games = Game.includes(:publisher, :platform)
                 .limit(10)
    @publishers = Publisher.limit(10)
    @platforms = Platform.limit(10)
  end
end
