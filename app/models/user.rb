class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end

  has_one :customer
  has_one :seller
  
  enum user_type:{
    admin: 0,
    seller: 1,
    customer: 2
  }

  def admin?
    self.user_type == "admin"
  end

  def seller?
    self.user_type == "seller"
  end

  def customer?
    self.user_type == "customer"
  end  

end
