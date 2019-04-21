class AddIdToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :step_id, :integer
  end
end
