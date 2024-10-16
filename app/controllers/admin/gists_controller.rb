class Admin::GistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @gists = Gist.all
  end

  def show
    @gist = Gist.find(params[:id])
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
