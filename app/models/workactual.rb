class Workactual < ActiveRecord::Base
    belongs_to :employee
    belongs_to :shift
end