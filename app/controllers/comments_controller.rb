class CommentsController < ApplicationController

 before_action :authenticate_author!, only: [ :create, :edit, :update, :destroy ]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post_id), notice: 'コメントを登録しました。'
    else
      redirect_to post_url(@comment.post_id)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_url(@comment.post_id), notice: 'コメントを更新しました'
    else
      redirect_to post_url(@comment.post_id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post_id = @comment.post_id
    @comment.destroy
    redirect_to post_url(post_id), alert: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
