class ResultsController < ApplicationController

  before_action :set_test_passage, only: %i[ show result update ]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_result_path(@test_passage)
    else
      redirect_to result_path(@test_passage)
    end
  end

  private

  def set_test_passage
    @test_passage = Result.find(params[:id])
  end

end
