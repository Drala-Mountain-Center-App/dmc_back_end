class Video < ApplicationRecord
  validates_presence_of :title, :speaker, :topic, :length, :date_recorded, :video_url, :img_url
end
