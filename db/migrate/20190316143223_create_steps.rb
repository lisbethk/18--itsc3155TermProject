class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :content
      t.string :extra
      t.timestamps
    end
  end
end
