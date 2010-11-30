class Product < ActiveRecord::Base
  
  def get_image
    return image || 'default.jpg'
  end
  
  def get_thumb
    return thumbnail || 'default_thumb.jpg'
  end
  
  def self.getCategories
    cats = ['Under-50', 'Northwest-Rugged','Cool-Stuff' ]
    return cats
  end
  
end
