class Product < ActiveRecord::Base
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  belongs_to :supplier
  has_many :carted_product 
  has_many :users, through: :carted_products 
  has_many :orders, through: :carted_products

  validates :name, presence: true
  validates :price, presence: true
  validates :image, presence: true
  

  SALES_TAX = 0.09

  def tax
    price * SALES_TAX
  end

  def total
    price + tax
  end

end
