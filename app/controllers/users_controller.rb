class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book = Book.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.update(user_params)
      flash[:notice] = 'successfully'
      redirect_to user_path(@user.id)
    else
      @users = User.all
      flash[:notice] = 'error'
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Welcome! You have signed up successfully.'
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = 'error'
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
