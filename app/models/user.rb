class User < ApplicationRecord
  has_many :results


  enum user_type: {
    student: 10,
    author: 20
  }

  def tests_by_level(level)
    Test.joins(:results)
        .where(results: {user_id: self.id})
        .where(level: level)
        .pluck(:title, :level)
  end

end
