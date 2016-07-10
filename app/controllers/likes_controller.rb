class LikesController < ApplicationController

  # イイネ
  def like
    post = post.find(params[:id])
    like = current_author.likes.build(id: post.id)
    like.save
    redirect_to posts#index
  end


end
