# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Criando usuário padrão..."

User.find_or_create_by!(email: 'usuario_teste@exemplo.com') do |user|
  user.password = 'senha_segura'
  user.full_name = 'Usuário de Teste'
end

puts "Usuário padrão criado com sucesso."