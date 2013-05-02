class Expression < ActiveRecord::Base
  belongs_to :chip
  belongs_to :tissue

  before_validation :check_chip_id
  before_validation :check_tissue_id
  before_validation :check_uniqueness

  validates :mean, presence: true, numericality: true
  validates :chip_id, :tissue_id, presence: true
  # validates :standard_deviation, presence: true, numericality: true

  scope :meaningful, -> { where("mean > 10") }
  scope :very_meaningful, -> { where("mean > 50") } # using SQL...?

  def check_uniqueness
    other_expressions = Expression.where(:chip_id => self.chip_id)
    # grabs other expression instances with the same chip id, then checks to make sure they don't also have the same tissue id
    puts other_expressions
    other_expressions.each do |ex|
      puts "ex:" 
      puts ex
      puts "ex's tissue_id:"
      puts ex.tissue_id
      puts "my tissue id: " 
      puts self.tissue_id
      puts " "
      if ex.tissue_id == self.tissue_id
        puts "expression: " + ex.id.to_s + " has same tissue id and chip id"
        return false
      else
        puts "no duplication"
      end
    end
  end

  def check_chip_id
    if Chip.find_by_id(self.chip_id).nil?
      puts "no such chip"
      return false
    end
  end

  def check_tissue_id
    if Tissue.find_by_id(self.tissue_id).nil?
      puts "No such tissue"
      return false
    end
  end

end
