class PostsController < ApplicationController
 before_action :authenticate_author!, only: [ :new, :create, :edit, :update, :destroy, :index]

  # TOPページ
  def index
    # データをすべて取ってきくる必要がある
    @q = Post.order(created_at: :desc).ransack(params[:q])
    @posts = @q.result.page(params[:page]).per(10)

    @new_posts = Post.find_newest_article
    @new_comments = Comment.find_newest_comment

    @tsubuyaki = Post.new
  end

  def new
    # 空枠を用意
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new #追加
    @comments = @post.comments #追加
  end

  def create
    @post = Post.new(
      user_id: current_author.id,
      body: post_params["body"],
      category_id: post_params["category_id"],
      likes_count: 100
      )
    if @post.save
      # redirect_to @post, notice: '投稿に成功しました。'
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: '更新に成功しました。'
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :root, notice: '削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :body, :category_id)
  end
end
