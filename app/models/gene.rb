class Gene < ActiveRecord::Base
  attr_accessible :name, :symbol

  validates :name, :symbol, presence: true
  validates :name, :symbol, uniqueness: true
  validates :name, length: { minimum: 5, maximum: 100 }
  # validates :name, length: { minimum: 5, maximum: 100 }, :allow_blank => true  ?

  has_many :chips

end
