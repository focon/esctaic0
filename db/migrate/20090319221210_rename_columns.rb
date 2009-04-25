class RenameColumns < ActiveRecord::Migration
  def self.up
     rename_column :publications, :year, :venu
     rename_column :publications, :venue, :year
     end 
  

  def self.down
    rename_column :publications, :venu, :year
    rename_column :publications, :year, :venue
  end
end
