class Employee < ActiveRecord::Base
    belongs_to :user
    belongs_to :department
    has_many :workplans
    has_many :shifts, :through => :workplans
    has_many :workactuals
    has_many :shifts, :through => :workactuals
end
