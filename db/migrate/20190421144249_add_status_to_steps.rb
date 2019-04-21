class AddStatusToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :status, :string
  end
end
