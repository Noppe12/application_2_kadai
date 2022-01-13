class UsersController < ApplicationController

  def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = @user.books.all
  end

  def edit
    if
      @user = User.find(params[:id])
      unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
      end
    end
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
