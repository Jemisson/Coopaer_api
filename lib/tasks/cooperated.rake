namespace :setup do
  desc 'Cria registros no banco de dados'
  task create_member_records: :environment do
    25.times do
      member = Member.create(
        email: Faker::Internet.email,
        password: 'password123',
        jti: "65b798ab-734c-4127-a209-ada5d3935c62"
      )
      
      profile_member = ProfileMember.create(
        member_id: member.id,
        name: Faker::Name.name,
        cell_phone: Faker::PhoneNumber.cell_phone,
        phone: Faker::PhoneNumber.phone_number,
        birth: Faker::Date.birthday(min_age: 18, max_age: 65),
        cpf: Faker::Number.number(digits: 11),
        rg: Faker::IDNumber.brazilian_id,
        gender: %w[male female].sample,
        marital_status: %w[solteiro cadado divorciado viúvo].sample,
        pis: Faker::Number.number(digits: 11),
        expedition: Faker::Address.city,
        mother_name: Faker::Name.name,
        father_name: Faker::Name.name,
        city_registration: Faker::Number.number(digits: 8)
      )

      2.times do
        AcademicEducational.create(
          profile_member_id: profile_member.id,
          degree: Faker::Educator.degree,
          course: Faker::Educator.course,
          number_register: Faker::Number.number(digits: 8)
        )
      end

      Address.create(
        profile_member_id: profile_member.id,
        street: Faker::Address.street_name,
        number: Faker::Address.building_number,
        neighborhood: Faker::Address.community,
        city: Faker::Address.city,
        uf: Faker::Address.state_abbr,
        mailing: Faker::Boolean.boolean,
        email_mailing: Faker::Internet.email
      )

      BankAccount.create(
        profile_member_id: profile_member.id,
        account: Faker::Bank.account_number,
        agency: Faker::Bank.routing_number,
        bank: Faker::Bank.name,
        account_type: Faker::Number.number(digits: 3),
        pix: Faker::Number.number(digits: 11),
      )

      2.times do
        Dependent.create(
          profile_member_id: profile_member.id,
          name: Faker::Name.name,
          birth: Faker::Date.birthday(min_age: 0, max_age: 18)
        )
      end
    end

    p 'Registros de cooperados criados com sucesso!'
  end
end
