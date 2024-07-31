class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :students, class_name: 'User', join_table: :attendance

  def self.sort_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :asc)
      .pluck(:title)
  end
end
