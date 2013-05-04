require 'csv'
module ImportGenes
  ROOT = "/Users/zlotnika/Documents/other work/gene-expressions/lib/import"
  MEANS = "/means.csv"
  STD = "/standard_deviations.csv"
  # chip name, gene title, gene symbol
  def csv(filename, action=nil)
    index = 0
    tissue_totals = []
    last_gene_symbol = ""
    CSV.foreach(filename) do |row|
      index += 1
      break if index >= 10  # this is for testing, yes?
      if index == 1
        tissue_totals = row
      elsif index == 2 
        row.each_with_index do |val, i|
          if i >= 3 then createBodyPart(val, tissue_totals[i]) end
        end
      else 
        if row[2] != "---"
          last_gene_symbol = row[2]
          createGene(row[2])
        end
        if row[1] != "---" and row[1] != last_gene_symbol
          createTag(row[1], last_gene_symbol)
          puts last_gene_symbol
          puts row[1]
        end
        createChip(row[0], last_gene_symbol)
        # starting with expressions....
        row.each_with_index do |val, i|
          if i > 2 #and x < 113
            createExpression(row[0], i - 2, val) # chip_name, tissue_id, mean
           # print (x - 2), " i: ", i
          end
        end
      end
    end
  end

  def createExpression(chip_name, tissue_id, mean)
    chip = Chip.find_by_name(chip_name)
    tissue = Tissue.find(tissue_id)
    Expression.create({ mean: mean, chip_id: chip.id, tissue_id: tissue.id })
  end
                       

  def createChip(name, gene_symbol)
    puts "created chip #{name}, belonging to gene #{gene_symbol}"
    gene = Gene.find_by_symbol(gene_symbol)
    Chip.create( {name: name, gene_id: gene.id })
  end

  def createTag(descriptor, gene_symbol)
    if descriptor != "---"
      gene = Gene.find_by_symbol(gene_symbol)
      Tag.create({ descriptor: descriptor, gene_id: gene.id })
      puts "created tag #{descriptor}, belonging to gene #{gene_symbol}"
    end
  end

  def createGene(symbol) # if calling createTag, would need additional arg, row[1]
    puts "created gene #{symbol}"
    Gene.create({ symbol: symbol })
  end

  def createBodyPart(name, tissue_total)
    puts "created part #{name}, #{tissue_total}"
    Tissue.create({ name: name, total: tissue_total })
  end

end

include ImportGenes
