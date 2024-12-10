class GistQuestionService
  Result = Struct.new(:success?, :link)

  def initialize(question, user, client = default_client)
    @question = question
    @test = question.test
    @client = client
    @user = user
  end

  def call
    response = @client.create_gist(gist_params)
    return Result.new(false, nil) unless response.html_url.present?
    create_gist(response)
    Result.new(true, response.html_url)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def create_gist(response)
    @question.gists.create!(
      link: response.html_url,
      user: @user
    )
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
