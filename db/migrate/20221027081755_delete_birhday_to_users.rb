class DeleteBirhdayToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :bithday
  end
end
