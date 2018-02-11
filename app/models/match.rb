class Match < ApplicationRecord  
  belongs_to :left, :class_name => 'Team', :foreign_key => 'left_id', optional: true
  belongs_to :right, :class_name => 'Team', :foreign_key => 'right_id', optional: true
end
