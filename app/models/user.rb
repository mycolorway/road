class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and , :trackable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :omniauthable
  # attr_accessible :title, :body
end
