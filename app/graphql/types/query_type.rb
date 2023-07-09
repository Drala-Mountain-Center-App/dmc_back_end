module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :all_users, [UserType], null: false

    def all_users
      User.all
    end

    field :user_by_email, Types::UserType, null: false, description: "Gets one user by email" do
      argument :email, String, required: true
    end

    def user_by_email(email)
      User.find_by(email)
    end

    field :user, Types::UserType, null: false, description: "Gets one user by ID" do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end
  end
end
