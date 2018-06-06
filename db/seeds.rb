# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(key: 'TITLE_STRING',value: 'WMSL World Cup 2018')
Config.create(key: 'SLIDE_IMAGE',value: 'wc2018-01.jpg,wc2018-02.jpg,wc2018-03.jpg,wc2018-04.jpg,wc2018-05.jpg,wc2018-06.jpg')
Config.create(key: 'API_COMPETITION_ID',value: '467')
Config.create(key: 'API_AUTH_TOKEN',value: '')

# Score Config
Config.create(key: 'BET_MAIN_FINAL_RESULT_SCORE',value: '5')
Config.create(key: 'BET_MAIN_LEFT_TEAM_SCORE',value: '1')
Config.create(key: 'BET_MAIN_RIGHT_TEAM_SCORE',value: '1')
Config.create(key: 'BET_MAIN_YELLOW_CARD_CONDITION',value: '3')
Config.create(key: 'BET_MAIN_YELLOW_CARD_SCORE',value: '1')
Config.create(key: 'BET_MAIN_NO_YELLOW_CARD_SCORE',value: '1')
Config.create(key: 'BET_MAIN_RED_CARD_SCORE',value: '3')
Config.create(key: 'BET_MAIN_NO_RED_CARD_SCORE',value: '1')
Config.create(key: 'BET_MAIN_OWN_GOAL_SCORE',value: '3')
Config.create(key: 'BET_MAIN_NO_OWN_GOAL_SCORE',value: '1')
Config.create(key: 'BET_MAIN_EXTRA_TIME_SCORE',value: '3')
Config.create(key: 'BET_MAIN_NO_EXTRA_TIME_SCORE',value: '1')
Config.create(key: 'BET_MAIN_PENALTY_SCORE',value: '3')
Config.create(key: 'BET_MAIN_NO_PENALTY_SCORE',value: '1')

# Cleasing Data
Bet.destroy_all
Group.destroy_all
Team.destroy_all
User.destroy_all
Match.destroy_all

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

Match01 = Match.create(title: 'A#1', description: 'Group-Stage', start: DateTime.parse('2018-06-14T18:00:00+03:00'), knockout: false, left: Russia, right: SaudiArabia)
Match02 = Match.create(title: 'A#1', description: 'Group-Stage', start: DateTime.parse('2018-06-15T17:00:00+05:00'), knockout: false, left: Egypt, right: Uruguay)
Match03 = Match.create(title: 'B#1', description: 'Group-Stage', start: DateTime.parse('2018-06-15T18:00:00+03:00'), knockout: false, left: Portugal, right: Spain)
Match04 = Match.create(title: 'B#1', description: 'Group-Stage', start: DateTime.parse('2018-06-15T21:00:00+03:00'), knockout: false, left: Morocco, right: Iran)
Match05 = Match.create(title: 'C#1', description: 'Group-Stage', start: DateTime.parse('2018-06-16T13:00:00+03:00'), knockout: false, left: France, right: Australia)
Match06 = Match.create(title: 'C#1', description: 'Group-Stage', start: DateTime.parse('2018-06-16T19:00:00+03:00'), knockout: false, left: Peru, right: Denmark)
Match07 = Match.create(title: 'D#1', description: 'Group-Stage', start: DateTime.parse('2018-06-16T16:00:00+03:00'), knockout: false, left: Argentina, right: Iceland)
Match08 = Match.create(title: 'D#1', description: 'Group-Stage', start: DateTime.parse('2018-06-16T21:00:00+03:00'), knockout: false, left: Croatia, right: Nigeria)
Match09 = Match.create(title: 'E#1', description: 'Group-Stage', start: DateTime.parse('2018-06-17T21:00:00+03:00'), knockout: false, left: Brazil, right: Switzerland)
Match10 = Match.create(title: 'E#1', description: 'Group-Stage', start: DateTime.parse('2018-06-17T16:00:00+04:00'), knockout: false, left: CostaRica, right: Serbia)
Match11 = Match.create(title: 'F#1', description: 'Group-Stage', start: DateTime.parse('2018-06-17T18:00:00+03:00'), knockout: false, left: Germany, right: Mexico)
Match12 = Match.create(title: 'F#1', description: 'Group-Stage', start: DateTime.parse('2018-06-18T15:00:00+03:00'), knockout: false, left: Sweden, right: SouthKorea)
Match13 = Match.create(title: 'G#1', description: 'Group-Stage', start: DateTime.parse('2018-06-18T18:00:00+03:00'), knockout: false, left: Belgium, right: Panama)
Match14 = Match.create(title: 'G#1', description: 'Group-Stage', start: DateTime.parse('2018-06-18T21:00:00+03:00'), knockout: false, left: Tunisia, right: England)
Match15 = Match.create(title: 'H#1', description: 'Group-Stage', start: DateTime.parse('2018-06-19T18:00:00+03:00'), knockout: false, left: Poland, right: Senegal)
Match16 = Match.create(title: 'H#1', description: 'Group-Stage', start: DateTime.parse('2018-06-19T15:00:00+03:00'), knockout: false, left: Colombia, right: Japan)

Match17 = Match.create(title: 'A#2', description: 'Group-Stage', start: DateTime.parse('2018-06-19T21:00:00+03:00'), knockout: false, left: Russia, right: Egypt)
Match18 = Match.create(title: 'A#2', description: 'Group-Stage', start: DateTime.parse('2018-06-20T18:00:00+03:00'), knockout: false, left: Uruguay, right: SaudiArabia)
Match19 = Match.create(title: 'B#2', description: 'Group-Stage', start: DateTime.parse('2018-06-20T15:00:00+03:00'), knockout: false, left: Portugal, right: Morocco)
Match20 = Match.create(title: 'B#2', description: 'Group-Stage', start: DateTime.parse('2018-06-21T21:00:00+03:00'), knockout: false, left: Iran, right: Spain)
Match21 = Match.create(title: 'C#2', description: 'Group-Stage', start: DateTime.parse('2018-06-21T16:00:00+05:00'), knockout: false, left: France, right: Peru)
Match22 = Match.create(title: 'C#2', description: 'Group-Stage', start: DateTime.parse('2018-06-21T20:00:00+04:00'), knockout: false, left: Denmark, right: Australia)
Match23 = Match.create(title: 'D#2', description: 'Group-Stage', start: DateTime.parse('2018-06-21T21:00:00+03:00'), knockout: false, left: Argentina, right: Croatia)
Match24 = Match.create(title: 'D#2', description: 'Group-Stage', start: DateTime.parse('2018-06-22T18:00:00+03:00'), knockout: false, left: Nigeria, right: Iceland)
Match25 = Match.create(title: 'E#2', description: 'Group-Stage', start: DateTime.parse('2018-06-22T15:00:00+03:00'), knockout: false, left: Brazil, right: CostaRica)
Match26 = Match.create(title: 'E#2', description: 'Group-Stage', start: DateTime.parse('2018-06-22T20:00:00+02:00'), knockout: false, left: Serbia, right: Switzerland)
Match27 = Match.create(title: 'F#2', description: 'Group-Stage', start: DateTime.parse('2018-06-23T21:00:00+03:00'), knockout: false, left: Germany, right: Sweden)
Match28 = Match.create(title: 'F#2', description: 'Group-Stage', start: DateTime.parse('2018-06-23T18:00:00+03:00'), knockout: false, left: SouthKorea, right: Mexico)
Match29 = Match.create(title: 'G#2', description: 'Group-Stage', start: DateTime.parse('2018-06-23T15:00:00+03:00'), knockout: false, left: Belgium, right: Tunisia)
Match30 = Match.create(title: 'G#2', description: 'Group-Stage', start: DateTime.parse('2018-06-24T15:00:00+03:00'), knockout: false, left: England, right: Panama)
Match31 = Match.create(title: 'H#2', description: 'Group-Stage', start: DateTime.parse('2018-06-24T21:00:00+03:00'), knockout: false, left: Poland, right: Colombia)
Match32 = Match.create(title: 'H#2', description: 'Group-Stage', start: DateTime.parse('2018-06-24T20:00:00+05:00'), knockout: false, left: Japan, right: Senegal)

Match33 = Match.create(title: 'A#3', description: 'Group-Stage', start: DateTime.parse('2018-06-25T18:00:00+04:00'), knockout: false, left: Uruguay, right: Russia)
Match34 = Match.create(title: 'A#3', description: 'Group-Stage', start: DateTime.parse('2018-06-25T17:00:00+03:00'), knockout: false, left: SaudiArabia, right: Egypt)
Match35 = Match.create(title: 'B#3', description: 'Group-Stage', start: DateTime.parse('2018-06-25T21:00:00+03:00'), knockout: false, left: Iran, right: Portugal)
Match36 = Match.create(title: 'B#3', description: 'Group-Stage', start: DateTime.parse('2018-06-25T20:00:00+02:00'), knockout: false, left: Spain, right: Morocco)
Match37 = Match.create(title: 'C#3', description: 'Group-Stage', start: DateTime.parse('2018-06-26T17:00:00+03:00'), knockout: false, left: Denmark, right: France)
Match38 = Match.create(title: 'C#3', description: 'Group-Stage', start: DateTime.parse('2018-06-26T17:00:00+03:00'), knockout: false, left: Australia, right: Peru)
Match39 = Match.create(title: 'D#3', description: 'Group-Stage', start: DateTime.parse('2018-06-26T21:00:00+03:00'), knockout: false, left: Nigeria, right: Argentina)
Match40 = Match.create(title: 'D#3', description: 'Group-Stage', start: DateTime.parse('2018-06-26T21:00:00+03:00'), knockout: false, left: Iceland, right: Croatia)
Match41 = Match.create(title: 'E#3', description: 'Group-Stage', start: DateTime.parse('2018-06-27T21:00:00+03:00'), knockout: false, left: Serbia, right: Brazil)
Match42 = Match.create(title: 'E#3', description: 'Group-Stage', start: DateTime.parse('2018-06-27T21:00:00+02:00'), knockout: false, left: Switzerland, right: CostaRica)
Match43 = Match.create(title: 'F#3', description: 'Group-Stage', start: DateTime.parse('2018-06-27T17:00:00+03:00'), knockout: false, left: SouthKorea, right: Germany)
Match44 = Match.create(title: 'F#3', description: 'Group-Stage', start: DateTime.parse('2018-06-27T19:00:00+05:00'), knockout: false, left: Mexico, right: Sweden)
Match45 = Match.create(title: 'G#3', description: 'Group-Stage', start: DateTime.parse('2018-06-28T20:00:00+02:00'), knockout: false, left: England, right: Belgium)
Match46 = Match.create(title: 'G#3', description: 'Group-Stage', start: DateTime.parse('2018-06-28T21:00:00+03:00'), knockout: false, left: Panama, right: Tunisia)
Match47 = Match.create(title: 'H#3', description: 'Group-Stage', start: DateTime.parse('2018-06-28T17:00:00+03:00'), knockout: false, left: Japan, right: Poland)
Match48 = Match.create(title: 'H#3', description: 'Group-Stage', start: DateTime.parse('2018-06-28T18:00:00+04:00'), knockout: false, left: Senegal, right: Colombia)

#Round of 16
Match49 = Match.create(title: 'Winners A vs Runners-up B', description: 'Round of 16', start: DateTime.parse('2018-06-30T21:00:00+03:00'), knockout: true)
Match50 = Match.create(title: 'Winners C vs Runners-up D', description: 'Round of 16', start: DateTime.parse('2018-06-30T17:00:00+03:00'), knockout: true)
Match51 = Match.create(title: 'Winners E vs Runners-up F', description: 'Round of 16', start: DateTime.parse('2018-07-1T17:00:00+03:00'), knockout: true)
Match52 = Match.create(title: 'Winners G vs Runners-up G', description: 'Round of 16', start: DateTime.parse('2018-07-1T21:00:00+03:00'), knockout: true)
Match53 = Match.create(title: 'Winners B vs Runners-up H', description: 'Round of 16', start: DateTime.parse('2018-07-2T18:00:00+03:00'), knockout: true)
Match54 = Match.create(title: 'Winners D vs Runners-up A', description: 'Round of 16', start: DateTime.parse('2018-07-2T21:00:00+03:00'), knockout: true)
Match55 = Match.create(title: 'Winners F vs Runners-up C', description: 'Round of 16', start: DateTime.parse('2018-07-3T17:00:00+03:00'), knockout: true)
Match56 = Match.create(title: 'Winners H vs Runners-up G', description: 'Round of 16', start: DateTime.parse('2018-07-3T21:00:00+03:00'), knockout: true)

#Quarter-finals
Match57 = Match.create(title: 'Winners 49 vs Winners 50', description: 'Quarter-finals', start: DateTime.parse('2018-07-6T17:00:00+03:00'), knockout: true)
Match58 = Match.create(title: 'Winners 53 vs Winners 54', description: 'Quarter-finals', start: DateTime.parse('2018-07-6T21:00:00+03:00'), knockout: true)
Match59 = Match.create(title: 'Winners 51 vs Winners 52', description: 'Quarter-finals', start: DateTime.parse('2018-07-7T18:00:00+03:00'), knockout: true)
Match60 = Match.create(title: 'Winners 55 vs Winners 56', description: 'Quarter-finals', start: DateTime.parse('2018-07-7T21:00:00+03:00'), knockout: true)

#Semi-finals
Match61 = Match.create(title: 'Winners 57 vs Winners 58', description: 'Semi-finals', start: DateTime.parse('2018-07-10T21:00:00+03:00'), knockout: true)
Match62 = Match.create(title: 'Winners 59 vs Winners 60', description: 'Semi-finals', start: DateTime.parse('2018-07-10T21:00:00+03:00'), knockout: true)

#Third place play-off
Match63 = Match.create(title: 'Losers 61 vs Losers 62', description: 'Third place play-off', start: DateTime.parse('2018-07-14T17:00:00+03:00'), knockout: true)

#Final
Match64 = Match.create(title: 'Winners 61 vs Winners 62', description: 'Final', start: DateTime.parse('2018-07-15T18:00:00+03:00'), knockout: true)

