class Market < ActiveRecord::Base
  has_many :vendors
  validates :name, presence: true

  def self.search(term)
    t = "%#{term}%"
    return Market.where("name LIKE ?" , t)
  end
end
