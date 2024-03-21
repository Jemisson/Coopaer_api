namespace :dev do
  desc 'Setup Development'
  task setup: :environment do
    p 'Executando o setup para desenvolvimento...'

    p 'APAGANDO BD...'
    `rails db:drop`

    p 'CRIANDO BD...'
    `rails db:create`

    p 'MIGRANDO TABELAS'
    `rails db:migrate`

    p 'CADASTRANDO USUÁRIOS PADRÕES'
    `rails cad:super_users`

    p 'CADASTRANDO DEMAIS EXEMPLOS'
    `rails setup:create_member_records`

    p 'Setup completado com sucesso!'
  end
end
