class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id")
        .where(tests: { level: level })
        .where(results: { user_id: self.id })
  end
end
