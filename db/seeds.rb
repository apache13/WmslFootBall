# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(key: 'TITLE_STRING',value: 'WMSL World Cup 2018')
Config.create(key: 'CLOSE_REGISTER_DATETIME',value: '2018-06-14T18:00:00+03:00')

Bet.destroy_all
User.destroy_all
Tester01 = User.create(provider: 'facebook', uid: '1735656219789615', name: 'Ohm Narawat', email: 'narawat777@gmail.com', image: 'http://graph.facebook.com/v2.6/1735656219789615/picture', admin: false)
Tester02 = User.create(provider: 'facebook', uid: '10155924626118820', name: 'Cat Oraphanthong', email: 'to_be_cat@hotmail.com', image: 'http://graph.facebook.com/v2.6/10155924626118820/picture', admin: false)
Tester03 = User.create(provider: 'facebook', uid: '1853148911385862', name: 'Kengkote Kote', email: 'kengkote@hotmail.com', image: 'http://graph.facebook.com/v2.6/1853148911385862/picture', admin: false)
Tester04 = User.create(provider: 'facebook', uid: '1695051147226674', name: 'Sutthisak Srimahakosol', email: 'mardnakub@hotmail.com', image: 'http://graph.facebook.com/v2.6/1695051147226674/picture', admin: false)

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
Match01 = Match.create(title: 'Match-01', description: 'Group-Stage-A#1', start: DateTime.parse('2018-06-14T18:00:00+03:00'), knockout: false, left: Russia, right: SaudiArabia)
Match02 = Match.create(title: 'Match-02', description: 'Group-Stage-A#1', start: DateTime.parse('2018-06-15T17:00:00+05:00'), knockout: false, left: Egypt, right: Uruguay)
Match03 = Match.create(title: 'Match-03', description: 'Group-Stage-B#1', start: DateTime.parse('2018-06-15T18:00:00+03:00'), knockout: false, left: Portugal, right: Spain)
Match04 = Match.create(title: 'Match-04', description: 'Group-Stage-B#1', start: DateTime.parse('2018-06-15T21:00:00+03:00'), knockout: false, left: Morocco, right: Iran)
Match05 = Match.create(title: 'Match-05', description: 'Group-Stage-C#1', start: DateTime.parse('2018-06-16T13:00:00+03:00'), knockout: false, left: France, right: Australia)
Match06 = Match.create(title: 'Match-06', description: 'Group-Stage-C#1', start: DateTime.parse('2018-06-16T19:00:00+03:00'), knockout: false, left: Peru, right: Denmark)
Match07 = Match.create(title: 'Match-07', description: 'Group-Stage-D#1', start: DateTime.parse('2018-06-16T16:00:00+03:00'), knockout: false, left: Argentina, right: Iceland)
Match08 = Match.create(title: 'Match-08', description: 'Group-Stage-D#1', start: DateTime.parse('2018-06-16T21:00:00+03:00'), knockout: false, left: Croatia, right: Nigeria)
Match09 = Match.create(title: 'Match-09', description: 'Group-Stage-E#1', start: DateTime.parse('2018-06-17T21:00:00+03:00'), knockout: false, left: Brazil, right: Switzerland)
Match10 = Match.create(title: 'Match-10', description: 'Group-Stage-E#1', start: DateTime.parse('2018-06-17T16:00:00+04:00'), knockout: false, left: CostaRica, right: Serbia)
Match11 = Match.create(title: 'Match-11', description: 'Group-Stage-F#1', start: DateTime.parse('2018-06-17T18:00:00+03:00'), knockout: false, left: Germany, right: Mexico)
Match12 = Match.create(title: 'Match-12', description: 'Group-Stage-F#1', start: DateTime.parse('2018-06-18T15:00:00+03:00'), knockout: false, left: Sweden, right: SouthKorea)
Match13 = Match.create(title: 'Match-13', description: 'Group-Stage-G#1', start: DateTime.parse('2018-06-18T18:00:00+03:00'), knockout: false, left: Belgium, right: Panama)
Match14 = Match.create(title: 'Match-14', description: 'Group-Stage-G#1', start: DateTime.parse('2018-06-18T21:00:00+03:00'), knockout: false, left: Tunisia, right: England)
Match15 = Match.create(title: 'Match-15', description: 'Group-Stage-H#1', start: DateTime.parse('2018-06-19T18:00:00+03:00'), knockout: false, left: Poland, right: Senegal)
Match16 = Match.create(title: 'Match-16', description: 'Group-Stage-H#1', start: DateTime.parse('2018-06-19T15:00:00+03:00'), knockout: false, left: Colombia, right: Japan)

Match17 = Match.create(title: 'Match-17', description: 'Group-Stage-A#2', start: DateTime.parse('2018-06-19T21:00:00+03:00'), knockout: false, left: Russia, right: Egypt)
Match18 = Match.create(title: 'Match-18', description: 'Group-Stage-A#2', start: DateTime.parse('2018-06-20T18:00:00+03:00'), knockout: false, left: Uruguay, right: SaudiArabia)
Match19 = Match.create(title: 'Match-19', description: 'Group-Stage-B#2', start: DateTime.parse('2018-06-20T15:00:00+03:00'), knockout: false, left: Portugal, right: Morocco)
Match20 = Match.create(title: 'Match-20', description: 'Group-Stage-B#2', start: DateTime.parse('2018-06-21T21:00:00+03:00'), knockout: false, left: Iran, right: Spain)
Match21 = Match.create(title: 'Match-21', description: 'Group-Stage-C#2', start: DateTime.parse('2018-06-21T16:00:00+05:00'), knockout: false, left: France, right: Peru)
Match22 = Match.create(title: 'Match-22', description: 'Group-Stage-C#2', start: DateTime.parse('2018-06-21T20:00:00+04:00'), knockout: false, left: Denmark, right: Australia)
Match23 = Match.create(title: 'Match-23', description: 'Group-Stage-D#2', start: DateTime.parse('2018-06-21T21:00:00+03:00'), knockout: false, left: Argentina, right: Croatia)
Match24 = Match.create(title: 'Match-24', description: 'Group-Stage-D#2', start: DateTime.parse('2018-06-22T18:00:00+03:00'), knockout: false, left: Nigeria, right: Iceland)
Match25 = Match.create(title: 'Match-25', description: 'Group-Stage-E#2', start: DateTime.parse('2018-06-22T15:00:00+03:00'), knockout: false, left: Brazil, right: CostaRica)
Match26 = Match.create(title: 'Match-26', description: 'Group-Stage-E#2', start: DateTime.parse('2018-06-22T20:00:00+02:00'), knockout: false, left: Serbia, right: Switzerland)
Match27 = Match.create(title: 'Match-27', description: 'Group-Stage-F#2', start: DateTime.parse('2018-06-23T21:00:00+03:00'), knockout: false, left: Germany, right: Sweden)
Match28 = Match.create(title: 'Match-28', description: 'Group-Stage-F#2', start: DateTime.parse('2018-06-23T18:00:00+03:00'), knockout: false, left: SouthKorea, right: Mexico)
Match29 = Match.create(title: 'Match-29', description: 'Group-Stage-G#2', start: DateTime.parse('2018-06-23T15:00:00+03:00'), knockout: false, left: Belgium, right: Tunisia)
Match30 = Match.create(title: 'Match-30', description: 'Group-Stage-G#2', start: DateTime.parse('2018-06-24T15:00:00+03:00'), knockout: false, left: England, right: Panama)
Match31 = Match.create(title: 'Match-31', description: 'Group-Stage-H#2', start: DateTime.parse('2018-06-24T21:00:00+03:00'), knockout: false, left: Poland, right: Colombia)
Match32 = Match.create(title: 'Match-32', description: 'Group-Stage-H#2', start: DateTime.parse('2018-06-24T20:00:00+05:00'), knockout: false, left: Japan, right: Senegal)

Match33 = Match.create(title: 'Match-33', description: 'Group-Stage-A#3', start: DateTime.parse('2018-06-25T18:00:00+04:00'), knockout: false, left: Uruguay, right: Russia)
Match34 = Match.create(title: 'Match-34', description: 'Group-Stage-A#3', start: DateTime.parse('2018-06-25T17:00:00+03:00'), knockout: false, left: SaudiArabia, right: Egypt)
Match35 = Match.create(title: 'Match-35', description: 'Group-Stage-B#3', start: DateTime.parse('2018-06-25T21:00:00+03:00'), knockout: false, left: Iran, right: Portugal)
Match36 = Match.create(title: 'Match-36', description: 'Group-Stage-B#3', start: DateTime.parse('2018-06-25T20:00:00+02:00'), knockout: false, left: Spain, right: Morocco)
Match37 = Match.create(title: 'Match-37', description: 'Group-Stage-C#3', start: DateTime.parse('2018-06-26T17:00:00+03:00'), knockout: false, left: Denmark, right: France)
Match38 = Match.create(title: 'Match-38', description: 'Group-Stage-C#3', start: DateTime.parse('2018-06-26T17:00:00+03:00'), knockout: false, left: Australia, right: Peru)
Match39 = Match.create(title: 'Match-39', description: 'Group-Stage-D#3', start: DateTime.parse('2018-06-26T21:00:00+03:00'), knockout: false, left: Nigeria, right: Argentina)
Match40 = Match.create(title: 'Match-40', description: 'Group-Stage-D#3', start: DateTime.parse('2018-06-26T21:00:00+03:00'), knockout: false, left: Iceland, right: Croatia)
Match41 = Match.create(title: 'Match-41', description: 'Group-Stage-E#3', start: DateTime.parse('2018-06-27T21:00:00+03:00'), knockout: false, left: Serbia, right: Brazil)
Match42 = Match.create(title: 'Match-42', description: 'Group-Stage-E#3', start: DateTime.parse('2018-06-27T21:00:00+02:00'), knockout: false, left: Switzerland, right: CostaRica)
Match43 = Match.create(title: 'Match-43', description: 'Group-Stage-F#3', start: DateTime.parse('2018-06-27T17:00:00+03:00'), knockout: false, left: SouthKorea, right: Germany)
Match44 = Match.create(title: 'Match-44', description: 'Group-Stage-F#3', start: DateTime.parse('2018-06-27T19:00:00+05:00'), knockout: false, left: Mexico, right: Sweden)
Match45 = Match.create(title: 'Match-45', description: 'Group-Stage-G#3', start: DateTime.parse('2018-06-28T20:00:00+02:00'), knockout: false, left: England, right: Belgium)
Match46 = Match.create(title: 'Match-46', description: 'Group-Stage-G#3', start: DateTime.parse('2018-06-28T21:00:00+03:00'), knockout: false, left: Panama, right: Tunisia)
Match47 = Match.create(title: 'Match-47', description: 'Group-Stage-H#3', start: DateTime.parse('2018-06-28T17:00:00+03:00'), knockout: false, left: Japan, right: Poland)
Match48 = Match.create(title: 'Match-48', description: 'Group-Stage-H#3', start: DateTime.parse('2018-06-28T18:00:00+04:00'), knockout: false, left: Senegal, right: Colombia)

#Round of 16
Match49 = Match.create(title: 'Match-49', description: 'Round of 16', start: DateTime.parse('2018-06-30T21:00:00+03:00'), knockout: true)
Match50 = Match.create(title: 'Match-50', description: 'Round of 16', start: DateTime.parse('2018-06-30T17:00:00+03:00'), knockout: true)
Match51 = Match.create(title: 'Match-51', description: 'Round of 16', start: DateTime.parse('2018-07-1T17:00:00+03:00'), knockout: true)
Match52 = Match.create(title: 'Match-52', description: 'Round of 16', start: DateTime.parse('2018-07-1T21:00:00+03:00'), knockout: true)
Match53 = Match.create(title: 'Match-53', description: 'Round of 16', start: DateTime.parse('2018-07-2T18:00:00+03:00'), knockout: true)
Match54 = Match.create(title: 'Match-54', description: 'Round of 16', start: DateTime.parse('2018-07-2T21:00:00+03:00'), knockout: true)
Match55 = Match.create(title: 'Match-55', description: 'Round of 16', start: DateTime.parse('2018-07-3T17:00:00+03:00'), knockout: true)
Match56 = Match.create(title: 'Match-56', description: 'Round of 16', start: DateTime.parse('2018-07-3T21:00:00+03:00'), knockout: true)

#Quarter-finals
Match57 = Match.create(title: 'Match-57', description: 'Quarter-finals', start: DateTime.parse('2018-07-6T17:00:00+03:00'), knockout: true)
Match58 = Match.create(title: 'Match-58', description: 'Quarter-finals', start: DateTime.parse('2018-07-6T21:00:00+03:00'), knockout: true)
Match59 = Match.create(title: 'Match-59', description: 'Quarter-finals', start: DateTime.parse('2018-07-7T18:00:00+03:00'), knockout: true)
Match60 = Match.create(title: 'Match-60', description: 'Quarter-finals', start: DateTime.parse('2018-07-7T21:00:00+03:00'), knockout: true)

#Semi-finals
Match61 = Match.create(title: 'Match-61', description: 'Semi-finals', start: DateTime.parse('2018-07-10T21:00:00+03:00'), knockout: true)
Match62 = Match.create(title: 'Match-62', description: 'Semi-finals', start: DateTime.parse('2018-07-10T21:00:00+03:00'), knockout: true)

#Third place play-off
Match63 = Match.create(title: 'Match-63', description: 'Third place play-off', start: DateTime.parse('2018-07-14T17:00:00+03:00'), knockout: true)

#Final
Match64 = Match.create(title: 'Match-64', description: 'Final', start: DateTime.parse('2018-07-15T18:00:00+03:00'), knockout: true)

