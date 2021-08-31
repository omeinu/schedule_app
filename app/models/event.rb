class Event < ApplicationRecord
    validates :title,{presence:true}
    validates :start_date,{presence:true}
    validates :end_date,{presence:true}
    validates :memo,{length:{maximum:20}}
end
