class AddStatusToProfileMember < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_members, :status, :integer, null: false, default: 0
  end
end
