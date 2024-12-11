class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = Result.find(params[:result_id])
    result = GistQuestionService.new(@test_passage.current_question, current_user).call

    if result.success?
      redirect_to @test_passage, notice: t('.success', url: result.link)
    else
      redirect_to @test_passage, alert: t('.failure')
    end
  end
end
