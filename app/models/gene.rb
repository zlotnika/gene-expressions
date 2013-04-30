class Gene < ActiveRecord::Base

#  attr_accessible :symbol

  validates :symbol, presence: true
  validates :symbol, uniqueness: true
  validates :symbol, length: { minimum: 3, maximum: 100 }

  has_many :chips

  def self.search(search = false)
    puts search
    if search
      find(:all, :conditions => ['symbol LIKE ?', "%#{search}%"])
# "genes"."symbol" = 9999 LIMIT 1
    else
      find(:all)
    end
  end

    def get_expressions()
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
   
    def get_expressions_by_chip(chip_id)
      expressions_array = []
      chip = Chip.find(chip_id)
      expressions = chip.expressions
      expressions.each do |ex|
        expressions_array.push(ex)
      end
      return expressions_array
    end
     

end
