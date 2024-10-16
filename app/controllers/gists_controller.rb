class GistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[ new create ]

  def new;

  end

  def create;

  end

  def show;

  end

  private

  def set_test_passage
    @test_passage = Result.find(params[:id])
  end

end
