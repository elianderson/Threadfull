class Category 
  
  CATS = ['Under-50', 'Northwest-Rugged','Cool-Stuff' ] 
  
  attr_accessor :name, :url, :raw
  
  def initialize(name)
    @name = name.gsub('-', ' ')
    @url = '/'+name
    @raw = name
  end
  
  def products(amount = 3)
    Product.where(:category => self.raw).limit(amount).order(:id)
  end
        
  # Static      
  def self.all
    CATS.collect{|c| Category.new(c)}
  end
  
end