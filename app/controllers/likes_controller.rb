class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    @like = like
    authorize like
 
    if like.save
      flash[:notice] = "Like status added"
      # redirect_to topics_path
    else
      flash[:error] = "Error updating Like status"
      # redirect_to topics_path
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id]) 
    like = current_user.likes.find(params[:id])  
    authorize like

    if like.destroy
      flash[:notice] = "Like status removed"
      # redirect_to topics_path
    else
      flash[:error] = "Error removing Like status"
      # redirect_to topics_path
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

end
