class Manager < ApplicationRecord
    has_many :departments
    has_many :employees, :through => :departments
end
