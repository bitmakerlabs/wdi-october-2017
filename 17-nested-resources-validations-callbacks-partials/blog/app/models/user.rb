class User < ActiveRecord::Base
  has_many :comments

  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
