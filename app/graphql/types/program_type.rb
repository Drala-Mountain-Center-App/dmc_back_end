module Types
  class ProgramType < Types::BaseObject
    field :name, String, null: false
    field :start_date, String, null: false
    field :end_date, String, null: false
    field :content, String, null: false
    field :image, String, null: false
    field :price, String, null: true
    field :url, String, null: false
    field :registration_url, String, null: false
    field :categories, [String], null: false
    field :teachers, [String], null: false
  end
end
