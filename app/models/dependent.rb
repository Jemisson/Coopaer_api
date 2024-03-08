# frozen_string_literal: true

class Dependent < ApplicationRecord
  belongs_to :profile_member
end
