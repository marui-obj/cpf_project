class Employee < ActiveRecord::Base
    belongs_to :user
    belongs_to :department
    has_and_belongs_to_many :shifts
end
