class AddStepsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :steps, :text
  end
end
