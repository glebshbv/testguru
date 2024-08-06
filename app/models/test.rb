class Test < ApplicationRecord
  has_one :category
  has_many :quesions
  has_many :results
  has_many :users, through: :results
  belongs_to :author, class_name: 'User', foreign_key: :author_id


  def self.titles_by_category(category_title)
    joins("INNER JOIN categories ON categories.id = tests.category_id")
      .where(categories: { title: category_title })
      .order(title: :asc)
      .pluck(:title)
  end
end
