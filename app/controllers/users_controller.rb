class UsersController < ApplicationController

  def show
    @user_bookmarks = current_user.bookmarks.order(:topic_id)
    @topics = @user_bookmarks.collect(&:topic)
    @user_liked_bookmarks = current_user.likes.collect(&:bookmark)
  end
  
end