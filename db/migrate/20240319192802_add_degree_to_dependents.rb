class AddDegreeToDependents < ActiveRecord::Migration[7.0]
  def change
    add_column :dependents, :degree, :string
  end
end
