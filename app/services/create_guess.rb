class CreateGuess
  def initialize(game, letter)
    @game = game
    @letter = letter
  end

  def call
    unless duplicate?
      guess = @game.guesses.new(letter: @letter)
      if guess.save
        UpdateLives.new(@game, guess).call
        CheckGame.new(@game, guess).call
        true
      else
        false
      end
    else
      false
    end
  end

  private

  def duplicate?
    @game.guesses.any? { |old_guess| old_guess.letter == @letter }
  end
end