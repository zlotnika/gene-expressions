# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

genes = Gene.create([{ symbol: 01234 }, { symbol: 56789 }, { symbol: 9999 }, { symbol: 221 }])
chips = Chip.create([{ chip_id: 44, gene_id: 1 }, { chip_id: 88, gene_id: 1 }, { chip_id: 174, gene_id: 2 }, { chip_id: 3, gene_id: 4 }])
tissues = Tissue.create([{ name: "brain", total: 16 }, { name: "spleen", total: 2 }, { name: "eye", total: 9 }, { name: "big toe", total: 81 }])
values = Value.create([{ mean: 101, standard_deviation: 20, chip_id: 1, tissue_id: 1 }, { mean: 11, standard_deviation: 21, chip_id: 1, tissue_id: 2 }, { mean: 1, standard_deviation: 2, chip_id: 1, tissue_id: 3 }, { mean: 18, standard_deviation: 1, chip_id: 2, tissue_id: 1 }, { mean: 99, standard_deviation: 12, chip_id: 3, tissue_id: 4 }])
