class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = @current_user.id
        @comments = @comment.protein.comments
        @comment.save
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comments = @comment.protein.comments
        @comment.destroy
    end

    def comment_params
        params.require(:comment).permit(:comment, :protein_id)
    end
end


