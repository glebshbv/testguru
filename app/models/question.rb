class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :body, presence: true

  def create_gist!(user, gist_result)
    gists.create!(
      user: user,
      link: gist_result.html_url
    )
  end

end
