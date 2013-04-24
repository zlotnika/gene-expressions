class Chip < ActiveRecord::Base
  belongs_to :gene
  attr_accessible :chip_id
end
