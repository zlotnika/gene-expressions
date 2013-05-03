class Tag < ActiveRecord::Base
#  attr_accessible :descriptor

  belongs_to :gene
end
