class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[ show result update gist ]

  def show;
  end

  def result;
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_result_path(@test_passage)
    else
      redirect_to result_path(@test_passage)
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question, current_user).call
    if result.persisted?
      redirect_to @test_passage, notice: t('.success', url: result.link)
    else
      redirect_to @test_passage, alert: t('.failure')
    end
  end

  private

  def set_test_passage
    @test_passage = Result.find(params[:id])
  end
end
