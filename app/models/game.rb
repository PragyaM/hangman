class Game < ActiveRecord::Base
  WORDS_FILE_PATH = Rails.root.join("app", "assets", "words.txt")
  MAX_GUESSES = 10

  has_many :guesses

  validates :word, :lives_remaining, presence: true

  scope :not_completed, -> {where(finished: false)}
  scope :completed, -> {where(finished: true)}

  before_validation :generate_word

  def won?
    (word.chars - guesses.pluck(:letter)).empty?
    #word.chars.all? {|letter| guesses.where(letter: letter).exists?}
  end

  def lost?
    lives_remaining == 0
  end

  private

  def generate_word
    self.word ||= File.read(WORDS_FILE_PATH).split.sample
  end
end
