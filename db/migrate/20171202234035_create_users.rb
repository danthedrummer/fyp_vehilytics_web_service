class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, {:id => false} do |t|
      t.string :name
      t.string :email, null: false
      t.string :password
      t.string :device_id
      t.string :vehicle_manufacturer

      t.timestamps
    end
    execute "alter table users add primary key(email)"
  end
end
