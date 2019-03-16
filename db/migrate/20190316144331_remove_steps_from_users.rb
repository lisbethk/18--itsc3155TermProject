class RemoveStepsFromUsers < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :users, :steps
  end
end
