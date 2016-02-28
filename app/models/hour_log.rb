class HourLog < ActiveRecord::Base

  def self.defaulthour
    order('last_name')
  end

  belongs_to :user
end
