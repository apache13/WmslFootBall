# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(key: 'TITLE_STRING',value: 'WMSL UEFA Champions League 2017-2018')
Config.create(key: 'SLIDE_IMAGE',value: 'ucl-01.jpg,ucl-02.jpg')

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

Bet.destroy_all
Group.destroy_all
Team.destroy_all
User.destroy_all
Match.destroy_all

UCL = Group.create(name: 'UCL')

Sevilla = Team.create(name: 'Sevilla', code: 'SEV', group: UCL, club: true)
Bayern = Team.create(name: 'Bayern', code: 'FCB', group: UCL, club: true)
Juventus = Team.create(name: 'Juventus', code: 'JUV', group: UCL, club: true)
RealMadrid = Team.create(name: 'RealMadrid', code: 'RMD', group: UCL, club: true)
Liverpool = Team.create(name: 'Liverpool', code: 'LIV', group: UCL, club: true)
ManchesterCity = Team.create(name: 'ManchesterCity', code: 'MCI', group: UCL, club: true)
Barcelona = Team.create(name: 'Barcelona', code: 'BCN', group: UCL, club: true)
Roma = Team.create(name: 'Roma', code: 'RMA', group: UCL, club: true)

MatchFinal = Match.create(title: 'Final', description: 'Final', start: DateTime.parse('2018-05-27T01:45:00+07:00'), knockout: true, left: RealMadrid, right: Liverpool)





