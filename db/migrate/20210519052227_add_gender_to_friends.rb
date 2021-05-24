class AddGenderToFriends < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :gender, :string
  end
end
