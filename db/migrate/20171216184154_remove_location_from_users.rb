class RemoveLocationFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :state, :string
    remove_column :users, :city, :string
  end
end
