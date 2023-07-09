class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :member
  has_many :meditations, dependent: :destroy
end
