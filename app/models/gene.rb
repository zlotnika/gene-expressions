class Gene < ActiveRecord::Base

#  attr_accessible :symbol

  validates :symbol, presence: true
  validates :symbol, uniqueness: true
  validates :symbol, length: { minimum: 3, maximum: 100 }

  has_many :chips
  has_many :tags

  def self.search(search = false)
    puts search
    if search
      find(:all, :conditions => ['symbol LIKE ?', "%#{search}%"])
# "genes"."symbol" = 9999 LIMIT 1
    else
      find(:all)
    end
  end

  def get_chips()
    chips_array = []
    self.chips.each do |chip|
      chips_array.push(chip)
    end
  end

  def get_expressions_by_chip(chip_id) # so you get [ expression, expression, expression ]
    expressions_array = []
    chip = Chip.find(chip_id)
    expressions = chip.expressions
    expressions.each do |ex|
      expressions_array.push(ex)
    end
    return expressions_array
  end
  
  def parse_expressions(expressions_array) # takes an array of expression objects, and outputs a hash that looks like this: { "brain" => [10, 12], "spleen" => 3, 5 }
    nicer_hash = {}
    expressions_array.each do |ex|
      wee_hash = {}
      t = Tissue.find(ex.tissue_id).name
      m = ex.mean
      std = ex.standard_deviation
      nicer_hash[t] = [m, std]
    end
    return nicer_hash
  end

  def get_expressions_hash(chips) # intakes an array of chip objects, outputs a hash of { chip => [["brain", 1, 2], ["ear', 3, 4]] 
    expressions_hash = {}
    chips.each do |chip|
    x = {}
      ex_array = self.get_expressions_by_chip(chip.id)
      x[chip.number] = self.parse_expressions(ex_array)
#      x[chip] = self.parse_expressions(ex_array)
      expressions_hash.merge!(x)
    end
    return expressions_hash
  end


  def get_means_to_plot(chips = self.chips) # will take in a list of chip objects, and output the format that flot likes of data: [[["brain", 101], ["spleen", 25]], [["brain", 18], ["spleen", 93]]].  or:  { chip => [[["brain", 101], ["spleen", 25]]], other_chip => [ [["brain", 18], ["spleen", 93]] ]
    out_array = []
    chips.each do |chip|
      chip_array = []
      chip.expressions.each do |ex|
        puts ex.id
        tissue = Tissue.find(ex.tissue_id).name
        mean = ex.mean
        mini_array = [tissue, mean]
        chip_array.push(mini_array)
      end
      out_array.push(chip_array)
    end
    return out_array
  end


  # not using below

  def turn_expressions_hash_to_json(hash)
    the_array = []
    hash.each do |k, v|
      v.each do |key, value|
        little_array = [key, value[0], value[1]]
        puts key, value[0]
      end
    end
  end



  def old_parse_expressions(expressions_array) # takes an array of expression objects, and outputs an array that looks like this: [["brain", 10, 12], ["spleen", 3, 5]]
    nicer_array = []
    expressions_array.each do |ex|
#      mini_array = []
      wee_hash = {}
      t = Tissue.find(ex.tissue_id).name
      m = ex.mean
      std = ex.standard_deviation
      wee_hash = { t => [m, std] }
      nicer_array.push(wee_hash)
      #mini_array = [t, m, std]
#      nicer_array.push(mini_array)
    end
    return nicer_array
  end


  def get_chip_expressions_hash(chips, expressions_array) # array of arrays
    hash = {}
    chips.each do |chip|
      hash[chip] = expressions_array
    end
    return hash
  end

  def get_expressions() # so you get all the expressions for one gene, not sorted by chip
    expressions_array = []
    chips = self.chips
    chips.each do |chip|
      expressions = chip.expressions
      expressions.each do |ex|
        expressions_array.push(ex)
      end
    end
    return expressions_array
  end
   
  def old_get_expressions_by_chip(chip_id) # so you get { chip_object => [expression, expression, expression] }
    chip = Chip.find(chip_id)
    expressions = chip.expressions
    expressions.each do |ex|
      expressions_array.push(ex)
    end
    hash_thing = { chip => expressions_array }
    return hash_thing
#    return expressions_array
  end



end
