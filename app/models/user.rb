class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin, :premium]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
  	self.role ||= :user
  end

  def set_premium_role!
  	self.role = :premium
  	self.save
  end

  def set_user_role!
  	self.role = :user
  	self.save
  end

  
end
