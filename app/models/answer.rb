class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    if question.answers.count >= 4
      errors.add(:question, "уже имеет максимальное количество ответов (4)")
    end
  end

end
