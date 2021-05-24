class AddAgeToFriends < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :age, :integer
  end
end
