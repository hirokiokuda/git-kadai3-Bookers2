class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully"
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

    def edit
      @book = Book.find(params[:id])
      user_id = params[:id].to_i
      login_user_id = current_user.id
    if(@book.user_id != login_user_id)
      redirect_to books_path
    end
    end

    def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated user successfully"
    redirect_to  book_path(@book)
    else
      @users = User.all
      render :edit
    end
    end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = @book.user

  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
