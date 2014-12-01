class CheckGame
  def initialize(game, guess)
    @game = game
    @guess = guess
  end

  def call
    if @game.won? || @game.lost?
      @game.finished = true
    end
    @game.save!
  end
end