class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category

  has_many :quesion, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.titles_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(:title)
      .pluck(:title)
  end
end
