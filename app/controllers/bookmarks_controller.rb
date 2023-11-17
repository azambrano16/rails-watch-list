class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def show
  end

  def create
    @list = List.find(list_params)
    @movie = Movie.find(movie_params)
    @bookmark = @list.bookmarks.create(movie: @movie)
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark created👍'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to @bookmark.list
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
