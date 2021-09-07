class Api::CommentsController < ApiController
  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to card_path(comment.card_id)
  end

  private
    def comment_params
      params.require(:comment).permit(
        :content,
        :card_id
      )
    end
end
