module Mutations
  class CreateMeditationByEmail < BaseMutation
    argument :total_sitting_time, Integer, required: true
    argument :user_email, String, required: true

    type Types::MeditationType

    def resolve(total_sitting_time: nil, user_email: nil)
      Meditation.create!(
        total_sitting_time: total_sitting_time,
        user: User.find_by(email: user_email)
      )
    end
  end
end
