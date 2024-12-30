# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Users
entity = Entity.find_or_create_by(name: 'Empresa XPTO')

AdminEntity.find_or_initialize_by(entity_id: entity.id, name: 'Demo User', email: 'demo@teste.com') do |admin|
  admin.password              = 'demoteste#321'
  admin.password_confirmation = 'demoteste#321'
  admin.save
end

%w[Alimentos Limpeza Higiene].each do |category|
  entity.categories.find_or_create_by(name: category)
end

30.times do
  entity.products.create(
    name: Faker::Book.title,
    price: Money.new(Faker::Number.between(from: 1, to: 99)),
    discount: Faker::Number.between(from: 1, to: 99),
    categories: [entity.categories.sample]
  )
end
