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
      if User.find_by(email).nil?
        GraphQL::ExecutionError.new("Invalid input: Couldn't find User with 'email'=#{email[:email]}")
      else
        User.find_by(email)
      end 
    end

    field :user, Types::UserType, null: false, description: "Gets one user by ID" do
      argument :id, ID, required: true
    end

    def user(id:)
      begin
        User.find(id)
      rescue => exception
        GraphQL::ExecutionError.new("Invalid input: #{exception.message}")
      end
    end

    field :all_meditations, [MeditationType], null: false, description: "Gets all meditations for signed in user"

    def all_meditations
      Meditation.where(user: context[:current_user])
    end

    field :all_videos, [VideoType], null: false

    def all_videos
      Video.all
    end

    field :video_by_id, Types::VideoType, null: false, description: "Gets one video by ID" do
      argument :id, ID, required: true
    end

    def video_by_id(id:)
      Video.find(id)
    end
    
    field :all_programs, [ProgramType], null: false, description: "Gets all programs"
    
    def all_programs
      program_facade.programs
    end

    private 

    def program_facade
      @_facade ||= CalendarFacade.new
    end
  end
end

