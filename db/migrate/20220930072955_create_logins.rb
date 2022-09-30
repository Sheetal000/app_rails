class CreateLogins < ActiveRecord::Migration[7.0]
  def change
    create_table :logins do |t|
      t.string :user_name
      t.integer :password

      t.timestamps
    end
  end
end
