class ChangePostPhoneDataType < ActiveRecord::Migration
  def self.up
    change_column :posts, :phone, :bigint
  end

  def self.down
    change_column :posts, :phone, :integer
  end
end
