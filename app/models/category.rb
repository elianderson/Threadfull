class Category 
  
  CATS = ['Under-50', 'Northwest-Rugged','Cool-Stuff' ] 
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def products(amount = 3)
    Product.where(:category => self.name).limit(amount).order(:id)
  end
        
  # Static      
  def self.all
    CATS.collect{|c| Category.new(c)}
  end
  
end