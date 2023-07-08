class User < ApplicationRecord
  validate_presence_of :first_name, :last_name, :email, :member
end
