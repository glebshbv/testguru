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
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.html_url?
      @test_passage.current_question.create_gist!(current_user, result)
      { notice: t('.success', url: result.html_url) }
    else
      { alert: t('.failure')}
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = Result.find(params[:id])
  end
end
