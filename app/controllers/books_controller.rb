class BooksController < ApplicationController
    before_action :authenticate_user!
  def index
    @books = current_user.books
  end

  def new
    if user_signed_in?
      @book = Book.new
    end

  end

  def create
    # create a new user if the author global is coming from the new
      @book = Book.new(user_params)
      @book.user = current_user
      if @book.save
        redirect_to @book
      else
        render 'new'
      end
    end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(user_params)
    redirect_to books_url
  end

  def destroy
    if is_admin?
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url
  else
    redirect_to edit_book_url
  end
  end

  def user_params
    params.require(:book).permit(:title ,:genre, :user_id)
  end

end
