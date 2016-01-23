class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :number, null: false
      t.timestamps null: false
      t.references :user
    end
  end
end
