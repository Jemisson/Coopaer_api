class AddCepToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :cep, :string
  end
end
