class Chip < ActiveRecord::Base
#  attr_accessible :chip_id

  validates :name, uniqueness: true, presence: true
  validates :gene_id, presence: true

  belongs_to :gene
  has_many :values #LJ

end