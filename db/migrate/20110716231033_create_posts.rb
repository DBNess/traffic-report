class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :url
      t.string :category
      t.integer :post_id
      t.string :slug
      t.string :title
      t.text :body
      t.timestamp :posted_at
      t.string :location
      t.integer :age
      t.integer :phone    
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
