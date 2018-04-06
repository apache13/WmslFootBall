# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(key: 'TITLE_STRING',value: 'WMSL UEFA Champions League 2017-2018')
Config.create(key: 'CLOSE_REGISTER_DATETIME',value: '2018-04-04T01:45:00+07:00')

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

UCL = Group.create(name: 'UCL')

Sevilla = Team.create(name: 'Sevilla', code: 'SEV', group: UCL, club: true)
Bayern = Team.create(name: 'Bayern', code: 'FCB', group: UCL, club: true)
Juventus = Team.create(name: 'Juventus', code: 'JUV', group: UCL, club: true)
RealMadrid = Team.create(name: 'RealMadrid', code: 'RMD', group: UCL, club: true)
Liverpool = Team.create(name: 'Liverpool', code: 'LIV', group: UCL, club: true)
ManchesterCity = Team.create(name: 'ManchesterCity', code: 'MCI', group: UCL, club: true)
Barcelona = Team.create(name: 'Barcelona', code: 'BCN', group: UCL, club: true)
Roma = Team.create(name: 'Roma', code: 'RMA', group: UCL, club: true)

Match01 = Match.create(title: 'Match#01', description: 'Quarter-finals Leg 1', start: DateTime.parse('2018-04-04T01:45:00+07:00'), knockout: false, left: Sevilla, right: Bayern)
Match02 = Match.create(title: 'Match#02', description: 'Quarter-finals Leg 1', start: DateTime.parse('2018-04-04T01:45:00+07:00'), knockout: false, left: Juventus, right: RealMadrid)
Match03 = Match.create(title: 'Match#03', description: 'Quarter-finals Leg 1', start: DateTime.parse('2018-04-05T01:45:00+07:00'), knockout: false, left: Liverpool, right: ManchesterCity)
Match04 = Match.create(title: 'Match#04', description: 'Quarter-finals Leg 1', start: DateTime.parse('2018-04-05T01:45:00+07:00'), knockout: false, left: Barcelona, right: Roma)




