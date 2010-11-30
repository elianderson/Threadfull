class ChangeCategoryToString < ActiveRecord::Migration
  def self.up
    change_column :products, :category, :string
     
  end

  def self.down
    change_column :products, :category, :integer
  end
end
