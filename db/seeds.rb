# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

transaction_types = [
  { kind: 1, description: 'Débito', operation: 0 },
  { kind: 2, description: 'Boleto', operation: 1 },
  { kind: 3, description: 'Financiamento', operation: 1 },
  { kind: 4, description: 'Crédito', operation: 0 },
  { kind: 5, description: 'Recebimento Empréstimo', operation: 0 },
  { kind: 6, description: 'Vendas', operation: 0 },
  { kind: 7, description: 'Recebimento TED', operation: 0 },
  { kind: 8, description: 'Recebimento DOC', operation: 0 },
  { kind: 9, description: 'Aluguel', operation: 1 }
]

TransactionType.insert_all!(transaction_types)
