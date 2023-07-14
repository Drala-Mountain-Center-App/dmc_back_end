module Mutations
  class CreateVideo < BaseMutation
    argument :vimeo_id, Integer, required: true
    argument :speaker, String, required: false
    argument :topic, String, required: false
    argument :date_recorded, String, required: false

    type Types::VideoType

    def resolve(vimeo_id: nil, speaker: nil, topic: nil, date_recorded: nil)
      video = VideoFacade.new(vimeo_id)
      Video.create!(
        title: video.title,
        description: video.description,
        speaker: speaker,
        topic: topic,
        length: video.length,
        date_recorded: date_recorded,
        video_url: video.video_url,
        thumbnail_url: video.thumbnail_url,
        embed_code: video.embed_code,
        vimeo_id: vimeo_id,
      )
    end
  end
end