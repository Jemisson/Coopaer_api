class CreateAcademicEducationals < ActiveRecord::Migration[7.0]
  def change
    create_table :academic_educationals do |t|
      t.string :degree
      t.string :course
      t.string :number_register
      t.references :profile_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
