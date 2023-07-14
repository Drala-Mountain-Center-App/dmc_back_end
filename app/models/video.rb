class Video < ApplicationRecord
  validates_presence_of :vimeo_id, :title, :speaker, :topic, :length, :date_recorded, :video_url, :thumbnail_url, :embed_code
end
