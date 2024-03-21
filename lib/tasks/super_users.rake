namespace :cad do
  desc "Extract data from PDF"
  task super_users: :environment do
    member = Member.create!(
      email: 'cooperado@coopaer.com.br',
      password: '12345678',
      jti: "65b798ab-734c-4127-a209-ada5d3935c62"
    )

    profile_member = ProfileMember.create(
      member_id: member.id,
      name: 'Cooperado Padrão',
      cell_phone: '67985632145',
      phone: '6734422145',
      birth: '2024-01-01',
      cpf: '12345678912',
      rg: '54632456',
      gender: %w[male female].sample,
      marital_status: %w[solteiro cadado divorciado viúvo].sample,
      pis: '126354859623',
      expedition: '2024-02-01',
      mother_name: 'Joana da Silva',
      father_name: 'João da Silva',
      city_registration: 'São Paulo'
    )

    AcademicEducational.create(
      profile_member_id: profile_member.id,
      degree: 'Doutor',
      course: 'Educação',
      number_register: '123456'
    )

    Address.create(
      profile_member_id: profile_member.id,
      street: 'Av. Brasil',
      number: 456,
      neighborhood: 'Centro',
      city: 'Campo Grande',
      uf: 'MS',
      mailing: 'Residência',
      email_mailing: 'cooperado@coopaer.com.br'
    )

    BankAccount.create(
      profile_member_id: profile_member.id,
      account: 002,
      agency: 1245,
      bank: 'BRC - BCO DE BRASILIA S.A.',
      account_type: 013,
      pix: '6734422145'
    )

    Dependent.create(
      profile_member_id: profile_member.id,
      name: 'José da Silva',
      birth: '2024-03-01'
    )

    Admin.create(
      email: 'admin@coopaer.com.br',
      password: '12345678',
      jti: "65b798ab-734c-4127-a209-ada5d3935c62"
    )
  end
end
