class CreateProfileMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_members do |t|
      t.references :member, null: false, foreign_key: true
      t.string :name
      t.string :cell_phone
      t.string :phone
      t.date :birth
      t.string :cpf
      t.string :rg
      t.integer :gender
      t.string :marital_status
      t.string :pis
      t.string :expedition
      t.string :mother_name
      t.string :father_name
      t.string :municipal_registration
      t.string :city_registration

      t.timestamps
    end
  end
end
