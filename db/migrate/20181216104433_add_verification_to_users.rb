class AddVerificationToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :verified, :boolean, default: false
  end

  def down
    remove_column :users, :verified
  end
end
