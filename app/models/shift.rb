class Shift < ActiveRecord::Base
    belongs_to :department
    has_and_belongs_to_many :employees
end