# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(key: 'TITLE_STRING',value: 'WMSL FA Cup 2017-2018')
Config.create(key: 'CLOSE_REGISTER_DATETIME',value: '2018-04-21T23:15:00+07:00')

# Score Config
Config.create(key: 'BET_MAIN_FINAL_RESULT_SCORE',value: '3')
Config.create(key: 'BET_MAIN_LEFT_TEAM_SCORE',value: '1')
Config.create(key: 'BET_MAIN_RIGHT_TEAM_SCORE',value: '1')
Config.create(key: 'BET_MAIN_YELLOW_CARD_CONDITION',value: '3')
Config.create(key: 'BET_MAIN_YELLOW_CARD_SCORE',value: '3')
Config.create(key: 'BET_MAIN_NO_YELLOW_CARD_SCORE',value: '1')
Config.create(key: 'BET_MAIN_RED_CARD_SCORE',value: '3')
Config.create(key: 'BET_MAIN_NO_RED_CARD_SCORE',value: '1')
Config.create(key: 'BET_MAIN_OWN_GOAL_SCORE',value: '3')
Config.create(key: 'BET_MAIN_NO_OWN_GOAL_SCORE',value: '1')
Config.create(key: 'BET_MAIN_EXTRA_TIME_SCORE',value: '3')
Config.create(key: 'BET_MAIN_NO_EXTRA_TIME_SCORE',value: '1')
Config.create(key: 'BET_MAIN_PENALTY_SCORE',value: '3')
Config.create(key: 'BET_MAIN_NO_PENALTY_SCORE',value: '1')

Bet.destroy_all
Group.destroy_all
Team.destroy_all
User.destroy_all
Match.destroy_all

# Test user
#Tester01 = User.create(provider: 'facebook', uid: '1735656219789615', name: 'Ohm Narawat', email: 'narawat777@gmail.com', image: 'http://graph.facebook.com/v2.6/1735656219789615/picture', admin: false)
#Tester02 = User.create(provider: 'facebook', uid: '10155924626118820', name: 'Cat Oraphanthong', email: 'to_be_cat@hotmail.com', image: 'http://graph.facebook.com/v2.6/10155924626118820/picture', admin: false)
#Tester03 = User.create(provider: 'facebook', uid: '1853148911385862', name: 'Kengkote Kote', email: 'kengkote@hotmail.com', image: 'http://graph.facebook.com/v2.6/1853148911385862/picture', admin: false)
#Tester04 = User.create(provider: 'facebook', uid: '1695051147226674', name: 'Sutthisak Srimahakosol', email: 'mardnakub@hotmail.com', image: 'http://graph.facebook.com/v2.6/1695051147226674/picture', admin: false)

FA = Group.create(name: 'FA Cup')

ManchesterUnited = Team.create(name: 'Manchester United', code: 'MUN', group: FA, club: true)
Chelsea = Team.create(name: 'Chelsea', code: 'CHE', group: FA, club: true)
TottenhamHotspur = Team.create(name: 'Tottenham Hotspur', code: 'TOT', group: FA, club: true)
Southampton = Team.create(name: 'Southampton', code: 'SOU', group: FA, club: true)

Match01 = Match.create(title: 'Match#01', description: 'Semi-finals', start: DateTime.parse('2018-04-21T23:15:00+07:00'), knockout: true, left: ManchesterUnited, right: TottenhamHotspur)
Match02 = Match.create(title: 'Match#02', description: 'Semi-finals', start: DateTime.parse('2018-04-22T21:00:00+07:00'), knockout: true, left: Chelsea, right: Southampton)
Match03 = Match.create(title: 'Winners Match#01 vs Winners Match#02', description: 'Final', start: DateTime.parse('2018-05-19T00:00:00+07:00'), knockout: true)



