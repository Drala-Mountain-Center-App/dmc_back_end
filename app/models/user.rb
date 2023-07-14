class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name, :last_name, :email
  validates :member, exclusion: { :in => [nil], :message => "can't be blank" }
  validates_uniqueness_of :email
  validates :password, length: { minimum: 6 }
  has_many :meditations, dependent: :destroy

  def total_meditations
    meditations.count
  end

  def total_meditation_time
    seconds = meditations.sum(:total_sitting_time)
    time_hash = { }
    time_hash[:seconds] = seconds
    formatted_time = format_time(seconds)
    time_hash[:formatted] = formatted_time
    time_hash.to_s
  end

  def format_time(seconds)
    time_array = ["#{seconds / 3600}", "#{seconds / 60 % 60}", "#{seconds % 60}"]
    formatted_time_array = add_time_string(time_array)
    formatted_time_array.select { |str| str =~ /[1-9]/ }.join(" ")
  end

  private

    def add_time_string(time_array)
      formatted_time_array = []
      time_array.each_with_index do |time, index|
        if time.to_i == 1 && index == 0
          formatted_time_array << (time + " hour")
        elsif index == 0
          formatted_time_array << (time + " hours")
        elsif time.to_i == 1 && index == 1
          formatted_time_array << (time + " minute")
        elsif index == 1
          formatted_time_array << (time + " minutes")
        elsif time.to_i == 1 && index == 2
          formatted_time_array << (time + " second")
        else index == 2
          formatted_time_array << (time + " seconds")
        end
      end
      formatted_time_array
    end
end
