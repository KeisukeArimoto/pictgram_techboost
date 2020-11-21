class CommentsController < ApplicationController
 
  def index
   @comments = Comment.all
  end
  
  def new
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
  end
 
  # コメント作成機能ver1
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save!
      redirect_to topics_path, success: 'コメントを投稿しました' #投稿一覧ページに戻る
    else
      flash.now[:danger] = "コメント投稿に失敗しました"
      redirect_to comments_new_path #コメント作成画面に改めて遷移する
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment,:user_id,:topic_id)
  end
end

