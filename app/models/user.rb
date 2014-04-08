class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  def ben?
    self.role == 'ben'
  end

  def admin?
    self.role == 'admin'
  end
end
