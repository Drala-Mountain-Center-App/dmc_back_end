module Mutations
  class CreateUser < BaseMutation
    class AuthProviderSignupData < Types::BaseInputObject
      argument :credentials, Types::AuthProviderCredentialsInput, required: false
    end

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :member, Boolean, required: true
    argument :auth_provider, AuthProviderSignupData, required: false

    type Types::UserType

    def resolve(first_name: nil, last_name: nil, member: nil, auth_provider: nil)
      User.create!(
        first_name: first_name,
        last_name: last_name,
        member: member,
        email: auth_provider&.[](:credentials)&.[](:email),
        password: auth_provider&.[](:credentials)&.[](:password),
        password_confirmation: auth_provider&.[](:credentials)&.[](:password_confirmation)
      )
    end
  end
end