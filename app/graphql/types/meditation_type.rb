module Types
  class MeditationType < Types::BaseObject
    field :id, ID, null: false
    field :total_sitting_time, Integer, null: false
    field :user_id, UserType, null: false, method: :user
  end
end
