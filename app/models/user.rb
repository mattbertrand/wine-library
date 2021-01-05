class User < ActiveRecord::Base
    has_many :wines
    has_secure_password
end
