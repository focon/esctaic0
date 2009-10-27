class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :publications_id
      t.binary :photo
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :forename
      t.string :surname
      t.string :email
      t.boolean :current
      t.string :admin_id

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
