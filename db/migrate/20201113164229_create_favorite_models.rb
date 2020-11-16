class CreateFavoriteModels < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_models do |t|
      t.string :post_id

      t.timestamps
    end
  end
end
