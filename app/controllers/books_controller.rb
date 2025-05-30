class BooksController < ApplicationController
  def new
    @book = Book.new(book_params)
  end

  def create
    @books = Book.all
    @c_user = User.find(current_user.id)
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  
  def index
    @c_user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
    @c_user = User.find(current_user.id)
  end

  def edit
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
