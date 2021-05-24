class CreateFriendsAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :friends_attachments do |t|
      t.integer :friend_id
      t.string :avatar

      t.timestamps
    end
  end
end
