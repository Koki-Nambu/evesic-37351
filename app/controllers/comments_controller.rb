class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/events/#{comment.event.id}"
  end



  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, event_id: params[:event_id])
  end

end
