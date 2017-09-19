# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Usuario.create(nome: 'Professor', email: 'professor@gmail.com', tipo: 1)
Usuario.create(nome: 'Aluno', email: 'aluno@gmail.com', tipo: 2)
