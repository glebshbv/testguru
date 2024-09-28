class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :name, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
