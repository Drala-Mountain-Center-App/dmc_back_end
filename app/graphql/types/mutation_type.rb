module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :create_meditation, mutation: Mutations::CreateMeditation
    field :create_video, mutation: Mutations::CreateVideo
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
