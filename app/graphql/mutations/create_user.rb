module Mutations
  class CreateUser < BaseMutation

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true
    argument :member, Boolean, required: true

    type Types::UserType

    def resolve(first_name: nil, last_name: nil, email: nil, member: nil)
      User.create!(
        first_name: first_name,
        last_name: last_name,
        email: email,
        member: member
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end