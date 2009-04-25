class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.text :author
      t.string :title
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
