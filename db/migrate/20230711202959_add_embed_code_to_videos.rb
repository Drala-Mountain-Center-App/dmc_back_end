class AddEmbedCodeToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :embed_code, :string
  end
end
