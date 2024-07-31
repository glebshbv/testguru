class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.sort_by_category(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
