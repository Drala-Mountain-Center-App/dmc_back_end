class AddColumnsToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :vimeo_id, :integer
    add_column :videos, :description, :string
    add_column :videos, :thumbnail_url, :string
  end
end
