class Meditation < ApplicationRecord
  validates_presence_of :total_sitting_time

  belongs_to :user
end
