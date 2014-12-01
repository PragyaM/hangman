require_relative '../services/create_guess'

class GuessesController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    letter = params.require(:guess)[:letter]

    unless CreateGuess.new(game, letter).call 
      flash[:alert] = "Invalid guess!"
    end

    redirect_to game
  end
end
