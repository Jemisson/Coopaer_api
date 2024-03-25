FactoryBot.define do
  factory :bank_account do
    account { "MyString" }
    agency { "MyString" }
    bank { "MyString" }
    account_type { "MyString" }
    pix { "MyString" }
    peorfile_member { nil }
  end
end
