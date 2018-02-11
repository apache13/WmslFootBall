# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(key: 'END_REGISTER',value: '2018-06-14T18:00:00+03:00')

Group.destroy_all
A = Group.create(name: 'A')
B = Group.create(name: 'B')
C = Group.create(name: 'C')
D = Group.create(name: 'D')
E = Group.create(name: 'E')
F = Group.create(name: 'F')
G = Group.create(name: 'G')
H = Group.create(name: 'H')

Team.destroy_all
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

Brazil = Team.create(name: 'Brazil', code: 'BR', group: E)
Switzerland = Team.create(name: 'Switzerland', code: 'CH', group: E)
CostaRica = Team.create(name: 'Costa Rica', code: 'CR', group: E)
Serbia = Team.create(name: 'Serbia', code: 'RS', group: E)

Germany = Team.create(name: 'Germany', code: 'DE', group: F)
Mexico = Team.create(name: 'Mexico', code: 'MX', group: F)
Sweden = Team.create(name: 'Sweden', code: 'SE', group: F)
SouthKorea = Team.create(name: 'South Korea', code: 'KR', group: F)

Belgium = Team.create(name: 'Belgium', code: 'BE', group: G)
Panama = Team.create(name: 'Panama', code: 'PA', group: G)
Tunisia = Team.create(name: 'Tunisia', code: 'TN', group: G)
England = Team.create(name: 'England', code: 'GB', group: G)

Poland = Team.create(name: 'Poland', code: 'PL', group: H)
Senegal = Team.create(name: 'Senegal', code: 'SN', group: H)
Colombia = Team.create(name: 'Colombia', code: 'CO', group: H)
Japan = Team.create(name: 'Japan', code: 'JP', group: H)

Match.destroy_all
Match01 = Match.create(title: 'Match-01', description: '', start: DateTime.parse('2018-06-14T18:00:00+03:00'), left: Russia, right: SaudiArabia)
Match02 = Match.create(title: 'Match-02', description: '', start: DateTime.parse('2018-06-15T17:00:00+05:00'), left: Egypt, right: Uruguay)
Match03 = Match.create(title: 'Match-03', description: '', start: DateTime.parse('2018-06-15T18:00:00+03:00'), left: Portugal, right: Spain)
Match04 = Match.create(title: 'Match-04', description: '', start: DateTime.parse('2018-06-15T21:00:00+03:00'), left: Morocco, right: Iran)
Match05 = Match.create(title: 'Match-05', description: '', start: DateTime.parse('2018-06-16T13:00:00+03:00'), left: France, right: Australia)
Match06 = Match.create(title: 'Match-06', description: '', start: DateTime.parse('2018-06-16T19:00:00+03:00'), left: Peru, right: Denmark)





