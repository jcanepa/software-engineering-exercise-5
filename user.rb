class User
  def self.find(id); end
  def self.create(email, password=Devise.friendly_token); end
end
