class Gene < ActiveRecord::Base

#  attr_accessible :symbol

  validates :symbol, presence: true
  validates :symbol, uniqueness: true
  validates :symbol, length: { minimum: 3, maximum: 100 }

  has_many :chips

  def self.search(search = false)
    puts search
    if search
#      find(:all, :conditions => ['symbol LIKE ?', self.symbol])
      find(:all, :conditions => ['symbol LIKE ?', "%#{search}%"])
 #     find(:all, :conditions => ["symbol", search LIMIT 1])
  #    find(:all, where("symbol = " + search))
# "genes"."symbol" = 9999 LIMIT 1
    else
      "puts grrr"
      find(:all)
    end
  end

end