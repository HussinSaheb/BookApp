module BooksHelper

  def user_params
    params.require(:author).permit(:firstName ,:lastName)
  end
end
