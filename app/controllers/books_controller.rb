class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    # create a new user if the author global is coming from the new
      @book = Book.new(user_params)
      if @book.save
        redirect_to @book
      else
        render 'new'
      end
    end

  def show
    @book = Book.find(params[:id])
    @author = @book.author
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
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url
  end

  def user_params
    params.require(:book).permit(:title ,:genre, :author_id)
  end

end
