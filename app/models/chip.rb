class Chip < ActiveRecord::Base
#  attr_accessible :chip_id

  validates :name, uniqueness: true, presence: true
  validates :gene_id, presence: true

  belongs_to :gene
  has_many :expressions #LJ

  def find_expression(body_part_id)
    ex = self.expressions.where("tissue_id = #{body_part_id}").first  # has to have .first, because this otherwise returns an array
    return ex
  end

# => Expression(id: integer, mean: float, standard_deviation: float, chip_id: integer, tissue_id: integer, created_at: datetime, updated_at: datetime) 
#1.9.3-p362 :064 > ex.class()
# returning:  => ActiveRecord::Relation
# but I want an Expression object


end
