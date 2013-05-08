class Gene < ActiveRecord::Base

#  attr_accessible :symbol

  validates :symbol, presence: true
  validates :symbol, uniqueness: true
  validates :symbol, length: { minimum: 3, maximum: 100 }

  has_many :probesets
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

  def get_probesets()
    probesets_array = []
    self.probesets.each do |probeset|
      probesets_array.push(probeset)
    end
  end

  def get_expressions_by_probeset(probeset_id) # so you get [ expression, expression, expression ]
    expressions_array = []
    probeset = Probeset.find(probeset_id)
    expressions = probeset.expressions
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

  def get_expressions_hash(probesets) # intakes an array of probeset objects, outputs a hash of { probeset => [["brain", 1, 2], ["ear', 3, 4]] 
    expressions_hash = {}
    probesets.each do |probeset|
    x = {}
      ex_array = self.get_expressions_by_probeset(probeset.id)
      x[probeset.number] = self.parse_expressions(ex_array)
#      x[probeset] = self.parse_expressions(ex_array)
      expressions_hash.merge!(x)
    end
    return expressions_hash
  end


  def get_means_to_plot(probesets = self.probesets) # will take in a list of probeset objects, and output the format that flot likes of data: [[["brain", 101], ["spleen", 25]], [["brain", 18], ["spleen", 93]]].  or:  { probeset => [[["brain", 101], ["spleen", 25]]], other_probeset => [ [["brain", 18], ["spleen", 93]] ]
    out_array = []
    probesets.each do |probeset|
      probeset_array = []
      probeset.expressions.each do |ex|
        puts ex.id
        tissue = Tissue.find(ex.tissue_id).name
        mean = ex.mean
        mini_array = [mean, tissue]
        probeset_array.push(mini_array)
      end
      out_array.push(probeset_array)
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


  def get_probeset_expressions_hash(probesets, expressions_array) # array of arrays
    hash = {}
    probesets.each do |probeset|
      hash[probeset] = expressions_array
    end
    return hash
  end

  def get_expressions() # so you get all the expressions for one gene, not sorted by probeset
    expressions_array = []
    probesets = self.probesets
    probesets.each do |probeset|
      expressions = probeset.expressions
      expressions.each do |ex|
        expressions_array.push(ex)
      end
    end
    return expressions_array
  end
   
  def old_get_expressions_by_probeset(probeset_id) # so you get { probeset_object => [expression, expression, expression] }
    probeset = Probeset.find(probeset_id)
    expressions = probeset.expressions
    expressions.each do |ex|
      expressions_array.push(ex)
    end
    hash_thing = { probeset => expressions_array }
    return hash_thing
#    return expressions_array
  end



end
