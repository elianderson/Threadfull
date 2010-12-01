class Product < ActiveRecord::Base
  
  def get_image
    return image || 'default.jpg'
  end
  
  def get_thumb
    return thumbnail || 'default_thumb.jpg'
  end
  
  def self.random_pros(cat_name = 'Northwest-Rugged', amount = 3)
    products = Product.where(:category => cat_name).limit(amount)
    
    return products
  end
  
  def self.getCategories
    cats = ['Under-50', 'Northwest-Rugged','Cool-Stuff' ]
    return cats
  end
  
end
