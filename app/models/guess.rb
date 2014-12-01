class Guess < ActiveRecord::Base
  belongs_to :game

  validates :game_id, :letter, presence: true
  validates :letter, uniqueness: {scope: :game_id, message: "should not be a duplicate guess"},
                     format: {with: /\A[a-zA-Z]\z/}

  def correct?
    game.word.chars.include?(letter)
  end
end
