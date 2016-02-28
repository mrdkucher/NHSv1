class HourLog < ActiveRecord::Base

  def self.defaulthour
    order("user_id")
  end

  belongs_to :user
end
