# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Criando contato..."
Contact.find_or_create_by(name: "XXX", phone: "(XX) XXXXX-XXXX", email: "x@x.com")
puts "Contato criado."
puts "Criando admin..."
user = User.create(email: "admin@admin.com", first_name: "Admin", last_name: "Admin",
              password: "123456"
            )
user.add_role :admin
puts "Admin criado."