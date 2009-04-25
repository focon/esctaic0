class CreateDetails < ActiveRecord::Migration
  def self.up
    create_table :details do |t|
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.string :empolyer
      t.string :street
      t.integer :number
      t.string :city
      t.string :region
      t.string :country
      t.string :zip
      t.string :telephone
      t.string :fax
      t.string :email
      t.boolean :member

      t.timestamps
    end
  end

  def self.down
    drop_table :details
  end
end
