require_relative 'devise'

class User
  def self.find(id); end

  def self.create(email, password=Devise.friendly_token)
    User.new
  end
end
