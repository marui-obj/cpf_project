class Shift < ActiveRecord::Base
    belongs_to :department
    has_many :workplans
    has_many :employees, :through => :workplans
end