class User < ApplicationRecord
  validate_presence_of :name, :email, :member
end
