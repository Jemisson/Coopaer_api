class CreateBankAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_accounts do |t|
      t.string :account
      t.string :agency
      t.string :bank
      t.string :account_type
      t.string :pix
      t.references :profile_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
