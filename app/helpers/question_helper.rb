module QuestionHelper

  def questions_header(question)
    "#{question.new_record? ? 'Create New' : 'Edit'} #{question.test.title} Question"
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
