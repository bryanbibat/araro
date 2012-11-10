class Plot < ActiveRecord::Base
  belongs_to :user
  belongs_to :variety
  attr_accessible :variety_id
end
