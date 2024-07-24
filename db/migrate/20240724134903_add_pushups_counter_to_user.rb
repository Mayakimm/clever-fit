class AddPushupsCounterToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pushups_counter, :integer
  end
end
