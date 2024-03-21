class CreateSenarReports < ActiveRecord::Migration[7.0]
  def change
    create_table :senar_reports do |t|
      t.references :profile_member, null: false, foreign_key: true
      t.string :name
      t.string :event
      t.string :event_init_date
      t.string :event_finish_date
      t.decimal :amount
      t.string :invoice
      t.string :receipt
      t.string :status_payment

      t.timestamps
    end
  end
end
