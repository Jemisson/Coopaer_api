FactoryBot.define do
  factory :address do
    street { "MyString" }
    number { 1 }
    neighborhood { "MyString" }
    city { "MyString" }
    uf { "MyString" }
    mailing { "MyString" }
    email_mailing { "MyString" }
    profile_member { nil }
  end
end
