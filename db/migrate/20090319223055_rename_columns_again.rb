class RenameColumnsAgain < ActiveRecord::Migration
  def self.up
     rename_column :publications, :venu, :venue
     end 
  

  def self.down
    rename_column :publications, :venue, :venu
      end
end
