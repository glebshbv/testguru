class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[ show edit update destroy ]

  def index
    @tests = Test.all
  end

  def create
    @test = current_user.authored_tests.new(test_params)
    if @test.save
      redirect_to @test, notice: t('.success')
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
      redirect_to tests_path, notice: t('admin.tests.create.success')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: t('admin.tests.create.success')
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
