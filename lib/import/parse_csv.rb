require 'csv'
module Import
  ROOT = "/Users/zlotnika/Documents/other work/gene-expressions/lib/import"
  MEANS = "/means.csv"
  STD = "/standard_deviations.csv"

  def csv(filename, action=nil)
    index = 0
    tissue_totals = []
    CSV.foreach(filename) do |row|
      index += 1
      break if index >= 4
      if index == 1
        tissue_totals = row
      elsif index == 2 
        row.each_with_index do |val, i|
          if i >= 3 then createBodyPart val, tissue_totals[i] end
        end
      else
        createGene row[1], row[2]
      end
      if 3 >= index and index >= 2 then puts row end
#      puts row
    end
  end

  def createGene(name, symbol)
#    puts "created gene #{name}, #{symbol}"
  end

  def createBodyPart(name, tissue_total)
#    puts "created part #{name}, #{tissue_total}"
  end
end

include Import
