module GamesHelper
  def filtered_word(game)
    game.word.chars.map do |letter| 
      if game.guesses.any? { |guess| guess.letter == letter }
        letter
      else
        "_"
      end
    end.join(" ")
  end

  def guessed_letters(game)
    game.guesses.map {|guess| guess.letter}.uniq
  end

  def wrong_letters(game)
    (guessed_letters(game) - game.word.chars).join(", ")
  end

  def image_for_lives(lives_remaining)
    "#{lives_remaining}.png"
  end

  def remaining_letters(game)
    ([*'a'..'z'] - guessed_letters(game)).join(" ")
  end
end
