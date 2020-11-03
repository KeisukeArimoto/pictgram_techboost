class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :discription, presence: true
  validates :image, presence: true
  
  belogs_to :user
  
  has_many :topics
  
  mount_uploader :image, ImageUploader
end
