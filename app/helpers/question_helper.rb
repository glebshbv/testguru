module QuestionHelper

  def questions_header(question)
    "#{question.new_record? ? 'Create New' : 'Edit'} #{question.test.title} Question"
  end

  def github_url(author, repo)
    url = "https://github.com/#{author}/#{repo}"
    link_to "Test Guru", url, class: 'text-blue-600 hover:underline', target: '_blank', rel: 'noopener noreferrer'
  end
end
