# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(key: 'TITLE_STRING',value: 'WMSL Football 2018')
Config.create(key: 'LOGIN_LOGO_1',value: 'coppa-01.jpg')
Config.create(key: 'LOGIN_LOGO_2',value: 'coppa-02.jpg')
Config.create(key: 'LOGIN_LOGO_3',value: 'fa-01.jpg')
Config.create(key: 'LOGIN_LOGO_4',value: 'fa-02.jpg')
Config.create(key: 'LOGIN_LOGO_5',value: 'ucl-01.jpg')
Config.create(key: 'LOGIN_LOGO_6',value: 'ucl-02.jpg')

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
UCL = Group.create(name: 'UCL')
COPPA = Group.create(name: 'Coppa')

Juventus = Team.create(name: 'Juventus', code: 'JUV', group: COPPA, club: true)
Milan = Team.create(name: 'AC Milan', code: 'ACM', group: COPPA, club: true)

RealMadrid = Team.create(name: 'RealMadrid', code: 'RMD', group: UCL, club: true)
Liverpool = Team.create(name: 'Liverpool', code: 'LIV', group: UCL, club: true)

ManchesterUnited = Team.create(name: 'Manchester United', code: 'MUN', group: FA, club: true)
Chelsea = Team.create(name: 'Chelsea', code: 'CHE', group: FA, club: true)

MatchFinalCoppa = Match.create(title: 'Coppa Italia', description: 'Coppa Italia', start: DateTime.parse('2018-05-10T02:00:00+07:00'), knockout: true,  left: Juventus, right: Milan)
MatchFinal = Match.create(title: 'FA Cup', description: 'FA Cup', start: DateTime.parse('2018-05-19T23:15:00+07:00'), knockout: true,  left: Chelsea, right: ManchesterUnited)
MatchFinalUCL = Match.create(title: 'UEFA Champions League', description: 'UEFA Champions League', start: DateTime.parse('2018-05-27T01:45:00+07:00'), knockout: true,  left: RealMadrid, right: Liverpool)


