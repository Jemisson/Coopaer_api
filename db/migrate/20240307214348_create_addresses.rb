class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :number
      t.string :neighborhood
      t.string :city
      t.string :uf
      t.string :mailing
      t.string :email_mailing
      t.references :profile_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
