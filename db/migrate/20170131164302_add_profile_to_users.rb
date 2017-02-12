class AddProfileToUsers < ActiveRecord::Migration[5.0]
  
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
  end

  def down
  	remove_column :users, :gender 
  	remove_column :users, :birthday 
  	remove_column :users, :last_name 
  	remove_column :users, :first_name   
  end

end
