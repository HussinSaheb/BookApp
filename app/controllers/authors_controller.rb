class AuthorsController < ApplicationController
  attr_accessor :firstName , :lastName
  def index
   @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
  # create a new user if the author global is coming from the new
    @author = Author.new(user_params)
    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update(user_params)
    redirect_to authors_url
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_url
  end
  def user_params
    params.require(:author).permit(:firstName ,:lastName)
  end

end
