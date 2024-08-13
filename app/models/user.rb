class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :email, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
