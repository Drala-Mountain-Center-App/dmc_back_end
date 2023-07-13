class Video < ApplicationRecord
  validates_presence_of :title, :speaker, :topic, :length, :date_recorded, :video_url, :embed_code
end
