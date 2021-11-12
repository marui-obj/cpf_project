class Department < ActiveRecord::Base
    has_many :shifts
end