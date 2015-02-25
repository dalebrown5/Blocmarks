class BookmarksController < ApplicationController

  def show
    @bookmarks = Bookmark.all
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.new(params.require(:bookmark).permit(:url))
    if @bookmark.save
      flash[:notice] = "Bookmark was created"
      redirect_to topics_path
    else
      flash[:error] = "Error creating bookmark"
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[id])
    if bookmark.update_attributes(params.require(:bookmark).permit(:url))
      redirect to topics_path, notice: "Bookmark was updated"
    else
      flash[:error] = "Error updating bookmark"
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :show
    end
  end

end
