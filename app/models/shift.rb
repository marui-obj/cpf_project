class Shift < ActiveRecord::Base
    belongs_to :department
    has_many :workplans
    has_many :employees, :through => :workplans
    has_many :workactuals
    has_many :employees, :through => :workactuals

    scope :day_filter, -> (date) {where date: date}
end