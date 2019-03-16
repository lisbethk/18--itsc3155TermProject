class AddExtraToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :extra, :string
  end
end
