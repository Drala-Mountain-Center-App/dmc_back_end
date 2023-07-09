class Video < ApplicationRecord
  validates_presence_of :title, :video_id, :speaker, :topic, :length, :date_recorded, :video_url, :img_url
end
