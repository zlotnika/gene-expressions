class Values < ActiveRecord::Base
  belongs_to :chip
  belongs_to :tissue
  attr_accessible :mean, :standard_deviation
end
