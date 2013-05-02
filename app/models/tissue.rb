class Tissue < ActiveRecord::Base
#  attr_accessible :name, :total
  validates :name, :total, presence: true
  validates :name, uniqueness: true
  validates :total, numericality: true
  
  has_many :expressions # LJ

end
