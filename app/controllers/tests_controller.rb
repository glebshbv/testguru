class TestsController < ApplicationController
  before_action :find_test, only: [:show, :edit, :update, :destroy]
  def index
    @tests = Test.all
  end

  def create
    @test = Test.new(test_params)
    @test.author = User.first
    if @test.save
      redirect_to @test, notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def show
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path, notice: 'Test was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: 'Test was successfully destroyed.'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
