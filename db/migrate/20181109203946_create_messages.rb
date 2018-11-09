class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :chatroom, foreign_key: true, null: false, index: true
      t.references :user, foreign_key: true, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
