module Types
  class VideoType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: true
    field :speaker, String, null: false
    field :topic, String, null: false
    field :length, String, null: false
    field :date_recorded, String, null: false
    field :video_url, String, null: false
    field :thumbnail_url, String, null: false
    field :embed_code, String, null: false
    field :vimeo_id, Integer, null: false
  end
end
