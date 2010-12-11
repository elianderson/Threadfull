class Product < ActiveRecord::Base
  
  def get_image
    image || 'default.jpg'
  end
  
  def get_thumb
    thumbnail || 'default_thumb.jpg'
  end
    
end
