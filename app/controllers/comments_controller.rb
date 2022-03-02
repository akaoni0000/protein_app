class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = @current_user.id
        @comment.save
    end

    def destroy
    end

    def comment_params
        params.require(:comment).permit(:comment, :protein_id)
    end
end


