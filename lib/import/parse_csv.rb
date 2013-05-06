require 'csv'
module ImportGenes
  ROOT = "/Users/zlotnika/Documents/other work/gene-expressions/lib/import"
  MEANS = "/means.csv"
  STD = "/standard_deviations.csv"
  # probeset number, gene title, gene symbol
  
  def count_rows(filename, action=nil)
    index = 0
    CSV.foreach(filename) do |row|
      puts index
      index += 1
    end
    puts index
    return index
  end

  def csv(filename, action=nil)
    index = 0
    tissue_totals = []
    CSV.foreach(filename) do |row|
      index += 1
      break if index >= 1000  # this is for testing, yes?
      if index == 1
        tissue_totals = row
      elsif index == 2 
        row.each_with_index do |val, i|
          if i >= 3 then createBodyPart(val, tissue_totals[i]) end
        end
      else 
        if row[2] != "---"
          createGene(row[2])
          createProbeset(row[0], row[2])  #(number, gene_symbol = nil)
        else
          createProbeset(row[0])
        end
        if row[1] != "---" #and row[1] != last_gene_symbol
          createTag(row[1], row[2]) #(descriptor, gene_symbol)
        end
        # starting with expressions....
        row.each_with_index do |val, i|
          if i > 2 
            createExpression(row[0], i - 2, val) # probeset_number, tissue_id, mean
          end
        end
      end
    end
  end

  def createExpression(probeset_number, tissue_id, mean)
    probeset = Probeset.find_by_number(probeset_number)
    tissue = Tissue.find(tissue_id)
    Expression.create({ mean: mean, probeset_id: probeset.id, tissue_id: tissue.id })
  end
                       
  def createProbeset(number, gene_symbol = nil)
    puts "created probeset #{number}, belonging to gene #{gene_symbol}"
    if gene_symbol
      gene = Gene.find_by_symbol(gene_symbol)
      Probeset.create({ number: number, gene_id: gene.id })
    else
      Probeset.create( {number: number })
    end
  end

  def createTag(descriptor, gene_symbol) # does not guarantee that a Tag will be unique.  but that may be fine.
    puts "creating tag"
    if descriptor != "---" and gene_symbol != "---"
      puts "gene symbol: "
      puts gene_symbol
      puts "descriptor: "
      puts descriptor
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
