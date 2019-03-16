class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    drop_table :steps
    create_table :steps do |t|
      t.string :content

      t.timestamps
    end
  end
end
