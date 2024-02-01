class BookmarksController < ApplicationController
  before_action :set_list, only: %i[index new create]

  def index
    @bookmarks = @bookmark.all
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @bookmark
    @bookmark.save
    redirect_to list_path(@bookmark)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
