class Tissue < ActiveRecord::Base
#  attr_accessible :name, :total
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :total, numericality: true # allow_nil: true
  
  has_many :expressions # LJ

end
