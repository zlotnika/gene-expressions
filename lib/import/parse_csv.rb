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
        createGene row[2]
        createTag row[1], row[2]
        createChip row[0], row[2]
      end
      if 3 >= index and index >= 2 then puts row end
#      puts row
    end
  end

  def createChip(name, gene_symbol)
    # puts "created chip #{name}, belonging to gene #{gene_symbol}"
    if gene_symbol == "---"
      symbol = Gene.last.symbol
    end
    # because sometimes there are many chips for one gene, and the symbol is not repeated in the csv file
    gene = Gene.find_by_symbol(symbol)
    Chip.create( {name: name, gene_id: gene.id })
  end

  def createTag(descriptor, gene_symbol)
    if descriptor != "---"
      if gene_symbol != descriptor
        gene = Gene.find_by_symbol(gene_symbol)
        Tag.create({ descriptor: descriptor, gene_id: gene.id })
      end
    end
  end


  def createGene(symbol) # if calling createTag, would need additional arg, row[1]
#    puts "created gene #{symbol}"
    if symbol != "---"
      gene = Gene.create({ symbol: symbol })
      # could call createTag here, thus not having an additional gene lookup... 
    end
  end

  def createBodyPart(name, tissue_total)
#    puts "created part #{name}, #{tissue_total}"
    Tissue.create({ name: name, total: tissue_total })
  end
end

include Import
