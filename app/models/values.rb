class Values < ActiveRecord::Base
  before_validation :check_chip_id
  before_validation :check_tissue_id
  before_validation :check_uniqueness

  attr_accessible :mean, :standard_deviation

  belongs_to :chip
  belongs_to :tissue

  validates :mean, presence: true, numericality: true
  validates :chip_id, :tissue_id, presence: true
 # validates :tissue_id, :chip_id, uniqueness: true
  # validates :standard_deviation, presence: true, numericality: true

  # needs to have a unique combination of chip and tissue id.  check for this?

  def check_uniqueness
    chip_id_examples = Values.find_by_chip_id(self.chip_id)
    v1 = Values.where('chip_id = ?', self.chip_id)
    v2 = Values.where(:chip_id => self.chip_id)
    # grabs other value instances with the same chip id, then checks to make sure they don't also have the same tissue id
    v2.each do |v|
      puts "v:" 
      puts v
      puts "v's tissue_id:"
      puts v.tissue_id
      puts "my tissue id: " 
      puts self.tissue_id
      puts " "
      if v.tissue_id = self.tissue_id
        puts "wrong"
      end
    end
  end

  def check_chip_id
    if Chip.find_by_id(self.chip_id).nil?
      puts "no such chip"
#      return false
    end
  end

  def check_tissue_id
    if Tissue.find_by_id(self.tissue_id).nil?
      puts "No such tissue"
      return false
    end
  end

end
