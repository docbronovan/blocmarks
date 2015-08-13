class LikesController < ApplicationController
  
  def create
    bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark_id: bookmark.id)

    if like.save
      #@like.bookmark_id << bookmark
      # Add code to generate a success flash and redirect to post
      flash[:notice] = "Bookmark was liked."
    else
      # Add code to generate a failure flash and redirect to post
      flash[:notice] = "There was an error liking the bookmark. Please try again."
    end
    redirect_to :back
  end

  def destroy
    like = Like.find(params[:id])

    if like.destroy
      # Add code to generate a success flash and redirect to post
      flash[:notice] = "Bookmark was unliked."
    else
      # Add code to generate a failure flash and redirect to post
      flash[:notice] = "There was an error liking the bookmark. Please try again."
    end
    redirect_to :back
  end

end
