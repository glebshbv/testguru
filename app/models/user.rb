class User < ApplicationRecord
  has_many :tests, foreign_key: 'author_id'

  def tests_by_level(level)
    tests.where(level: level)
  end
end
