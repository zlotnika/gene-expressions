class Chip < ActiveRecord::Base
  attr_accessible :chip_id

  validates :chip_id, uniqueness: true, presence: true

  belongs_to :gene
end
