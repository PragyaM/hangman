class UpdateLives
  def initialize(game, guess)
    @game = game
    @guess = guess
  end

  def call
    @game.lives_remaining -= 1 unless @guess.correct?

    @game.save!
  end
end