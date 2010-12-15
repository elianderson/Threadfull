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
  
  def self.check_category(category)
    if category == 'Under-50' || category == 'Northwest-Rugged' || category == 'Cool-Stuff'
       true
    else
      false
    end
  end
  
  # Static      
  def self.all
    CATS.collect{|c| Category.new(c)}
  end
  
end