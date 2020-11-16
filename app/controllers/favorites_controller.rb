class FavoritesController < ApplicationController
  def index
    @favorite_topics= current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new #favoriteクラスのインスタンス作成
    favorite.user_id = current_user.id #current_userのidを変数に代入
    favorite.topic_id= params[:topic_id]
    
    if favorite.save #likeが保存できているかどうかで条件分岐
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入り登録に失敗しました'
    end
  end
  
  
  # いいねしたものを取り消す機能 
   def destroy
    favorite = Favorite.find_by(user_id: current_user.id,topic_id: params[:topic_id])
    favorite.destroy if favorite.present?
    if favorite.destroyed?
      redirect_to topics_path, success: 'いいねを取り消しました'
    else
      redirect_to topics_path, danger: "いいねの削除に失敗しました"
    end
   end
   
  #いいねの合計を表示する機能
   def show
    # @topic = Topic.find_by(topic_id: params[:topic_id])
    @topic = Topic.find_by(user_id: favorite.user)
    @user = @topic.user
    @favorites_count = favorite.where(topic_id: @user.id).count
   end
  
  
end
