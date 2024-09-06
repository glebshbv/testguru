class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def success?
    return true if calculate_percentage >= 0.85
    return false
  end

  def result_percentage
    calculate_percentage * 100
  end

  private

  def calculate_percentage
    correct_questions.to_f / total_questions_count.to_f
  end

  def set_current_question
    self.current_question = next_question
  end

  def next_question
    if new_test?
      set_first_question
    else
      set_next_question
    end
  end

  def new_test?
    self.current_question.nil?
  end

  def set_first_question
    test.questions.first
  end

  def set_next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
     correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def total_questions_count
    test.questions.count
  end

end
