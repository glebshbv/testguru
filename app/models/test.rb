class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category

  has_many :quesion, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

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
