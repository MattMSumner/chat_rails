class CreateChatrooms < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'citext'

    create_table :chatrooms do |t|
      t.citext :topic, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
