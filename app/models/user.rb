class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

  def get_ordered_bookmarks
    current_topic = nil
    bookmarks_by_topic = []
    # loop through users bookmarks and if current_topic changes, then create new hash
    self.bookmarks.each do |bookmark|
      if current_topic != bookmark.topic
        current_topic = bookmark.topic
        topic_hash = {topic_name: current_topic.title, bookmarks: []}
      end

    end
  end

  # [
  # {topic_name: 'test topic name', bookmarks: [bookmarks]},
  # {topic_name: 'test topic name 2', bookmarks: [bookmarks]}
  # ]
  
end
