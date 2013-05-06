class Chip < ActiveRecord::Base
#  attr_accessible :chip_id

  validates :number, uniqueness: true, presence: true
  validates :gene_id, numericality: true, allow_nil: true

  belongs_to :gene
  has_many :expressions #LJ

  def find_expression(body_part_id)
    ex = self.expressions.where("tissue_id = #{body_part_id}").first  # has to have .first, because this otherwise returns an array
    return ex
  end

  def get_means()
    expressions = self.expressions
    mean_array = []
    if expressions
      for ex in expressions
        tissue_id = ex.tissue_id
        tissue = Tissue.find(tissue_id).name
        mean = ex.mean
        wee_array = [mean, tissue]
        mean_array.push(wee_array)
      end
      return mean_array
     else
      return 0
    end
  end
      

# => Expression(id: integer, mean: float, standard_deviation: float, chip_id: integer, tissue_id: integer, created_at: datetime, updated_at: datetime) 
#1.9.3-p362 :064 > ex.class()
# returning:  => ActiveRecord::Relation
# but I want an Expression object


end
