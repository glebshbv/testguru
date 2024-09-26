class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false, message: "email exists" },
                    format: { with: VALID_EMAIL_REGEX, message: "incorrect format" }
  validates :password, presence: true, confirmation: true


  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
