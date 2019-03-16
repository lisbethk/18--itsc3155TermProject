class AddSteptoUser < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :steps, :users
  end
end
