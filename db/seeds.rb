# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

genes = Gene.create([{ symbol: "Nov-1" }, { symbol: "HERC6174" }, { symbol: "3HDCMA18P" }, { symbol: "4HBS1L" }]) 
tissues = Tissue.create([{ name: "brain", total: 16 }, { name: "spleen", total: 2 }, { name: "eye", total: 9 }, { name: "big toe", total: 81 }, { name: "heart", total: 2 }, { name: "elbow", total: 24 } ])
chips = Chip.create([{ name: "148760-at", gene_id: 1 }, { name: "78639-at", gene_id: 1 }, { name: "231880_at", gene_id: 1 }, { name: "1564514_at", gene_id: 2 }, { name: "205464_at", gene_id: 4 }, {name: "217507_at", gene_id: 1 }])
expressions = Expression.create([{ mean: 71, standard_deviation: 20, chip_id: 1, tissue_id: 1 }, { mean: 11, standard_deviation: 21, chip_id: 1, tissue_id: 2 }, { mean: 1, standard_deviation: 2, chip_id: 1, tissue_id: 6 }, { mean: 18, standard_deviation: 1, chip_id: 2, tissue_id: 1 }, { mean: 49, standard_deviation: 12, chip_id: 3, tissue_id: 4 }, { mean: 15, standard_deviation: 18, chip_id: 3, tissue_id: 1}, { mean: 31, standard_deviation: 0, chip_id: 3, tissue_id: 3 }, { mean: 12, standard_deviation: 21, chip_id: 2, tissue_id: 2 }, { mean: 2, standard_deviation: 2, chip_id: 1, tissue_id: 4 }, { mean: 28, standard_deviation: 3, chip_id: 4, tissue_id: 3 }, { mean: 9, standard_deviation: 12, chip_id: 3, tissue_id: 5 }, { mean: 15, standard_deviation: 18, chip_id: 3, tissue_id: 6}, { mean: 5, standard_deviation: 1, chip_id: 1, tissue_id: 5}, { mean: 18, standard_deviation: 3, chip_id: 5, tissue_id: 2 }, { mean: 20, standard_deviation: 8, chip_id: 5, tissue_id: 4 }, { mean: 29, standard_deviation: 2, chip_id: 5, tissue_id: 5 }, { mean: 23, standard_deviation: 18, chip_id: 6, tissue_id: 1 }, { mean: 38, standard_deviation: 44, chip_id: 6, tissue_id: 3 }, { mean: 33, standard_deviation: 22, chip_id: 6, tissue_id: 6 }])
users = User.create([{ email: "zlotnika@gmail.com", password: "password" }, { email: "mintblue87@gmail.com", password: "choochoo" }])


