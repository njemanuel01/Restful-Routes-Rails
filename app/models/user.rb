class User < ActiveRecord::Base
  validates :email, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true
  has_many :stories
  
  
  def valid_password?(password)
    if !(BCrypt::Password.new(self.password) == password)
      binding.pry
      errors.messages["login"] = "Login Failed."
    end
    return errors.messages.empty?
  end
  
end 