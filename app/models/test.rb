class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level, message: "Может существовать только один Тест с данным названием и уровнем" }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def self.titles_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(:title)
      .pluck(:title)
  end
end
