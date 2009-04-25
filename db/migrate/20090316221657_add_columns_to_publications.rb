class AddColumnsToPublications < ActiveRecord::Migration
def self.up 
  add_column :publications, :url, :string  
add_column :publications, :year, :string 
add_column :publications, :venue, :string 
end 
def self.down 
  remove_column :publications, :url  
remove_column :publications, :year
remove_column :publications, :venue

end
end
