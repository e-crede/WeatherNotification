class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :first_name, limit: 40
      t.string :last_name, limit: 40
      t.string :email, limit: 40
      t.string :chat_telegram

      t.timestamps
    end
  end
end
