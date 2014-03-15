class User < ActiveRecord::Base

  has_many :memberships
  has_many :projects, :through => :memberships
  has_many :tasks, :through => :projects

  validates :first_name, :last_name, :email, :password, presence: true

end
