# frozen_string_literal: true

class Member < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_one :profile_member

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
