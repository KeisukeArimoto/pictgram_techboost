class FavoritesController < ApplicationController
  def index
    @favorite_topics= current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id= params[:topic_id]
    
    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入り登録に失敗しました'
    end
  end
  
  
  # いいねしたものを取り消す機能
  def destroy
    Favorite.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    redirect_to posts_path
  end
  
  
end
