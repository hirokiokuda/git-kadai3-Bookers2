class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    user_id = params[:id].to_i
    login_user_id = current_user.id
  if(user_id != login_user_id)
    redirect_to user_path(login_user_id)
  end
  @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully"
    redirect_to  user_path
    else
      @users = User.all
      render :edit
    end
  end
  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end


