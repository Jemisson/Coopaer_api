class AddJtiToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :jti, :string, null: false
    add_index :members, :jti, unique: true
  end
end
