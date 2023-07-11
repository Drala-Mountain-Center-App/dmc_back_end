class RemoveImgUrlFromVideos < ActiveRecord::Migration[7.0]
  def change
    remove_column :videos, :img_url, :string
  end
end
