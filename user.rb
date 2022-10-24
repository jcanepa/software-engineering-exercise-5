class User
  def initialize
    puts "user"
  end

  def self.find(id)
    return 'foo'
  end

  def self.create(email=nil, password=nil)
    return 'foo'
  end
end
