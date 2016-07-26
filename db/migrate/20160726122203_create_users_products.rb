class CreateUsersProducts < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :products
  end
end
