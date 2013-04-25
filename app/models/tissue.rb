class Tissue < ActiveRecord::Base
  attr_accessible :name, :total
  validates :name, :total, presence: true
  validates :total, numericality: true
end
