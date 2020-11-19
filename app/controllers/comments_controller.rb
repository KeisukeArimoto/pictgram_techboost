class CommentsController < ApplicationController
 
  def index
   @comments = Comment.all
  end
  
  def new
    @comment = Comment.new
  end
 
  # コメント作成機能ver1
  def create
    # @topic = Topic.find(params[:user_id])
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました' #投稿一覧ページに戻る
    else
      flash.now[:danger] = "コメント投稿に失敗しました"
      redirect_to comments_new_path #コメント作成画面に改めて遷移する
    end
  end
  
  # コメント削除機能
  # def destroy
  #   @topic = Topic.find(params[:topic_id])
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  #   redirect_to request.referer
  # end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

