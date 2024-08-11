class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_answers_count

  private

  def validate_answers_count
    if answers.count < 1 || answers.count > 4
      errors.add(:answers, "У одного Вопроса может быть от 1-го до 4-х ответов" )
    end
  end
end
