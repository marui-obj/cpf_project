class User < ApplicationRecord
    has_secure_password
    has_one :manager
    has_one :employee
end