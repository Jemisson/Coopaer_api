namespace :dev do
  desc 'Setup Development'
  task setup: :environment do
    p 'Executando o setup para desenvolvimento...'

    p "APAGANDO BD... #{`rails db:drop`}"
    p "CRIANDO BD... #{`rails db:create`}"
    p `rails db:migrate`
    p `rails setup:create_member_records`

    p 'Setup completado com sucesso!'
  end
end
