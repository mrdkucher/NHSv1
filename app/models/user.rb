class User < ActiveRecord::Base
  has_secure_password
  has_many :hour_logs

  def self.defaultuser
    order('last_name')
  end

  def admin?
    self.role == "Admin"
  end
end