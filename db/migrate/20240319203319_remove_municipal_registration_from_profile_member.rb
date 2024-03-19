class RemoveMunicipalRegistrationFromProfileMember < ActiveRecord::Migration[7.0]
  def change
    remove_column :profile_members, :municipal_registration, :string
  end
end
