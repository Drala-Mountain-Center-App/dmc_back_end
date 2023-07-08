class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  validates :member, inclusion: [true, false]
  validates_uniqueness_of :email
end
