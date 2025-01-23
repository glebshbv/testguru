class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[ show edit update destroy ]

  def index
    @tests = Test.all
  end

  def create
    @test = current_user.authored_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new, status: :unprocessable_entity
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
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success')
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
