class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name, :last_name, :email
  validates :member, exclusion: { :in => [nil], :message => "can't be blank" }
  validates_uniqueness_of :email
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  has_many :meditations, dependent: :destroy
end
