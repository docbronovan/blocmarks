class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    authorize @bookmarks
    @bookmarks_topics = current_user.bookmarks.group_by(&:topic)
    @likes = Like.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @topic_id = @bookmark.topic_id
  end

  def new
    @bookmark = current_user.bookmarks.new
    authorize @bookmark
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:url))
    authorize @bookmark
    @bookmark.topic_id = @topic.id
    
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
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark was removed."
    else
      flash[:notice] = "Bookmark couldn't be deleted. Try again"
    end
    redirect_to topics_path
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
       flash[:notice] = "URL was updated."
       redirect_to @bookmark
     else
       flash[:error] = "There was an error saving the bookmark. Please try again."
       render :edit
     end
  end
end
