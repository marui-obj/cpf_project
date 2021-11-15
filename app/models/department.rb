class Department < ActiveRecord::Base
    has_many :shifts
    has_many :employees
    belongs_to :manager
end