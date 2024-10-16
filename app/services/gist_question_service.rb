class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || OktokitClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

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
    content = [@question.body]
    @question.answers.each { |a| content << a.body }
    content.join("\n")
  end
end
