class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  validates :member, exclusion: { :in => [nil], :message => "can't be blank" }
  validates_uniqueness_of :email
  has_many :meditations, dependent: :destroy
end
