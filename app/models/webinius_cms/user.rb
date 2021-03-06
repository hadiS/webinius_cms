module WebiniusCms
  class User < ApplicationRecord
    has_secure_password

    validates_presence_of :name, :username
    validates :password, :presence => true, :on => :create
    validates :password_confirmation, :presence => true, :on => :create
  end
end
