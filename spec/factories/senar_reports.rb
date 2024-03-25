FactoryBot.define do
  factory :senar_report do
    profile_member { nil }
    name { "MyString" }
    event { "MyString" }
    event_init_date { "MyString" }
    event_finish_date { "MyString" }
    amount { "9.99" }
    invoice { "MyString" }
    receipt { "MyString" }
  end
end
