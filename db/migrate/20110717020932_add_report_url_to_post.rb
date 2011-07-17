class AddReportUrlToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :report_url, :string
  end

  def self.down
    remove_column :posts, :report_url
  end
end
