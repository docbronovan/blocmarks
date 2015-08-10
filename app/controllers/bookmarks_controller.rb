class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @topic_id = @bookmark.topic_id
  end

  def new
    @bookmark = Bookmark.new
    @topic_id = @bookmark.topic_id
  end

  def create
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:url,:topic, :user))
    @bookmark.user_id = current_user.id
    

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:notice] = "Comment couldn't be deleted. Try again"
    end
  end

  def edit
  end
end
