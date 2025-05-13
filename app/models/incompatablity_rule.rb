class IncompatablityRule < ApplicationRecord
    belongs_to :first_option, class_name: "Option"
    belongs_to :second_option, class_name: "Option"
end
