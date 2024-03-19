class AddCndToProfileMember < ActiveRecord::Migration[7.0]
  def change
    add_column :profile_members, :cnd, :string
  end
end
