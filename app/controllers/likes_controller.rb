class LikesController < ApplicationController

  # イイネ
  def create
    @post = Post.find(params[:post_id])
    @like = current_author.likes.build(user_id: current_author.id,post_id: @post.id)
    @like.save
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_author.likes.find_by(user_id: current_author.id,post_id: @post.id)
    @like.destroy
    redirect_to posts_url
  end

end
