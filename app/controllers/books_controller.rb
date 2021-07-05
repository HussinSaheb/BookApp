class BooksController < ApplicationController
rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @books = Book.all
  end

  def new
    if user_signed_in?
      @book = Book.new
    else
      redirect_to new_user_session
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
    @book = Book.find(params[:id])
    authorize @book
    if @book.destroy
      redirect_to books_url
    end
  end
    
  def user_not_authorized
    flash[:alert] = "You are not authorized to preform this action"
     redirect_to books_url
  end

  def user_params
    params.require(:book).permit(:title ,:genre, :user_id)
  end

end
