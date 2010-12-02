class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :desc_short
      t.string :link
      t.integer :category
      t.string :image
      t.string :thumbnail

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
