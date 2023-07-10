module Mutations
  class CreateMeditation < BaseMutation
    argument :total_sitting_time, Integer, required: true
    
    type Types::MeditationType

    def resolve(total_sitting_time: nil)
      Meditation.create!(
        total_sitting_time: total_sitting_time,
        user: context[:current_user]
      )
    end
  end
end