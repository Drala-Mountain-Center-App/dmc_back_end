module Types
  class MeditationType < Types::BaseObject
    field :id, ID, null: false
    field :total_sitting_time, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :completed_by, UserType, null: false, method: :user
  end
end
