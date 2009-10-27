class AddCountryToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :country, :string
    add_column :members, :nationalrep, :boolean
    Member.reset_column_information 
  end

  def self.down
    remove_column :members, :nationalrep
    remove_column :members, :country
  end
end
