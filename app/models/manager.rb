class Manager < ActiveRecord::Base
    belongs_to :user
    has_many :departments
end
