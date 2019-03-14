class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :standing
      t.string :experience
      t.string :goal

      t.timestamps
    end
  end
end
