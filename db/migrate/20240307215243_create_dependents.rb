class CreateDependents < ActiveRecord::Migration[7.0]
  def change
    create_table :dependents do |t|
      t.string :name
      t.date :birth
      t.references :profile_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
