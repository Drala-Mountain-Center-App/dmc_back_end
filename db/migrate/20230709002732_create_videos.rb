class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :speaker
      t.string :topic
      t.string :length
      t.string :date_recorded
      t.string :video_url
      t.string :img_url

      t.timestamps
    end
  end
end
