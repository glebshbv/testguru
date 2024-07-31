class User < ApplicationRecord

  has_and_belongs_to_many :taken_tests, class_name: 'Test', join_table: :attendance

  enum user_type: {
    student: 10,
    author: 20
  }

  def tests_by_level(level)
    taken_tests.where(level: level)
  end

end
