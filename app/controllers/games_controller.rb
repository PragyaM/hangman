class GamesController < ApplicationController
  def index
    @games = Game.completed.limit(10).order("id desc")
  end

  def show # GET /games/[id]
    @game = Game.find(params[:id])
    @guesses = @game.guesses.order(:id)
    @lives_remaining = @game.lives_remaining
  end

  def create # POST /games
    game = Game.create!
    redirect_to game
  end
end
