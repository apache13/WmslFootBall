# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(key: 'TITLE_STRING',value: 'WMSL FA Cup 2017-2018')
Config.create(key: 'LOGIN_LOGO',value: 'fa.jpg')

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

FA = Group.create(name: 'FA Cup')

ManchesterUnited = Team.create(name: 'Manchester United', code: 'MUN', group: FA, club: true)
Chelsea = Team.create(name: 'Chelsea', code: 'CHE', group: FA, club: true)
TottenhamHotspur = Team.create(name: 'Tottenham Hotspur', code: 'TOT', group: FA, club: true)
Southampton = Team.create(name: 'Southampton', code: 'SOU', group: FA, club: true)

MatchFinal = Match.create(title: 'Final', description: 'Final', start: DateTime.parse('2018-05-19T23:15:00+07:00'), knockout: true,  left: Chelsea, right: ManchesterUnited)



