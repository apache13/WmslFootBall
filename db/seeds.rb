# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

A = Group.create(name: 'A')
B = Group.create(name: 'B')
C = Group.create(name: 'C')
D = Group.create(name: 'D')
E = Group.create(name: 'E')
F = Group.create(name: 'F')
G = Group.create(name: 'G')
H = Group.create(name: 'H')

Russia = Team.create(name: 'Russia', code: 'RU', group: A)
SaudiArabia = Team.create(name: 'Saudi Arabia', code: 'SA', group: A)
Egypt = Team.create(name: 'Egypt', code: 'EG', group: A)
Uruguay = Team.create(name: 'Uruguay', code: 'UY', group: A)

Portugal = Team.create(name: 'Portugal', code: 'PT', group: B)
Spain = Team.create(name: 'Spain', code: 'ES', group: B)
Morocco = Team.create(name: 'Morocco', code: 'MA', group: B)
Iran = Team.create(name: 'Iran', code: 'IR', group: B)

France = Team.create(name: 'France', code: 'FR', group: C)
Australia = Team.create(name: 'Australia', code: 'AU', group: C)
Peru = Team.create(name: 'Peru', code: 'PE', group: C)
Denmark = Team.create(name: 'Denmark', code: 'DK', group: C)

Argentina = Team.create(name: 'Argentina', code: 'AR', group: D)
Iceland = Team.create(name: 'Iceland', code: 'IS', group: D)
Croatia = Team.create(name: 'Croatia', code: 'HR', group: D)
Nigeria = Team.create(name: 'Nigeria', code: 'NG', group: D)

