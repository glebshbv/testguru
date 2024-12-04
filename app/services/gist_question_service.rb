class GistQuestionService

  def initialize(question, user, client = default_client)
    @question = question
    @test = question.test
    @client = client
    @user = user
  end

  def call
    response = @client.create_gist(gist_params)
    return unless response.html_url.present?
    @question.gists.create!(
      link: response.html_url,
      user: @user
    )
  end

  private

  def default_client
    OktokitClient.new
  end

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
