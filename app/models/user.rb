class User < ApplicationRecord

  def tests_by_level(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id INNER JOIN users on results.user_id = users.id")
        .where(level: level, users: { id: self.id })
        .select("tests.*")
  end
end
