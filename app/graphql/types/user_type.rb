module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :email, String, null: false
    field :member, Boolean, null: false
    field :total_meditations, Integer, null: false, method: :total_meditations
    field :total_meditation_time, String, null: false, method: :total_meditation_time
    field :average_meditation_time, String, null: false, method: :average_meditation_time
  end
end
