module Mutations
  class CreateVideo < BaseMutation
    argument :title, String, required: true
    argument :speaker, String, required: false
    argument :topic, String, required: false
    argument :length, String, required: false
    argument :date_recorded, String, required: false 
    argument :video_url, String, required: false
    argument :embed_code, String, required: false

    type Types::VideoType

    def resolve(title: nil, speaker: nil, topic: nil, length: nil, date_recorded: nil, video_url: nil, embed_code: nil)
      Video.create!(
        title: title,
      )
    end
  end
end