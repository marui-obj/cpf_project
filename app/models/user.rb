class User < ActiveRecord::Base
    has_one :manager
    has_one :employee
end