# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(key: 'TITLE_STRING',value: 'WMSL EPL 2017-2018')
Config.create(key: 'SLIDE_IMAGE',value: 'epl-01.jpg,epl-02.jpg')

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

EPL = Group.create(name: 'English Premier League')

ManchesterCity = Team.create(name: 'Manchester City', code: 'MCI', group: EPL, club: true)
ManchesterUnited = Team.create(name: 'Manchester United', code: 'MUN', group: EPL, club: true)
Liverpool = Team.create(name: 'Liverpool', code: 'LIV', group: EPL, club: true)
Chelsea = Team.create(name: 'Chelsea', code: 'CHE', group: EPL, club: true)
TottenhamHotspur = Team.create(name: 'Tottenham Hotspur', code: 'TOT', group: EPL, club: true)
Arsenal = Team.create(name: 'Arsenal', code: 'ARS', group: EPL, club: true)
Burnley = Team.create(name: 'Burnley', code: 'BUR', group: EPL, club: true)
LeicesterCity = Team.create(name: 'Leicester City', code: 'LEI', group: EPL, club: true)
Everton = Team.create(name: 'Everton', code: 'EVE', group: EPL, club: true)
Bournemouth = Team.create(name: 'Bournemouth', code: 'BOU', group: EPL, club: true)
Watford = Team.create(name: 'Watford', code: 'WAT', group: EPL, club: true)
WestHamUnited = Team.create(name: 'West Ham United', code: 'WHU', group: EPL, club: true)
NewcastleUnited = Team.create(name: 'Newcastle United', code: 'NEW', group: EPL, club: true)
BrightonAndHoveAlbion = Team.create(name: 'Brighton and Hove Albion', code: 'BHA', group: EPL, club: true)
CrystalPalace = Team.create(name: 'Crystal Palace', code: 'CRY', group: EPL, club: true)
SwanseaCity = Team.create(name: 'Swansea City', code: 'SWA', group: EPL, club: true)
HuddersfieldTown = Team.create(name: 'HuddersfieldTown', code: 'HUD', group: EPL, club: true)
Southampton = Team.create(name: 'Southampton', code: 'SOU', group: EPL, club: true)
StokeCity = Team.create(name: 'Stoke City', code: 'STK', group: EPL, club: true)
WestBromwichAlbion = Team.create(name: 'West Bromwich Albion', code: 'WBA', group: EPL, club: true)

Match01 = Match.create(title: 'Match#01', description: 'EPL-32', start: DateTime.parse('2018-04-07T18:30:00+07:00'), knockout: false, left: Everton, right: Liverpool)
Match02 = Match.create(title: 'Match#02', description: 'EPL-32', start: DateTime.parse('2018-04-07T21:00:00+07:00'), knockout: false, left: Bournemouth, right: CrystalPalace)
Match03 = Match.create(title: 'Match#03', description: 'EPL-32', start: DateTime.parse('2018-04-07T21:00:00+07:00'), knockout: false, left: BrightonAndHoveAlbion, right: HuddersfieldTown)
Match04 = Match.create(title: 'Match#04', description: 'EPL-32', start: DateTime.parse('2018-04-07T21:00:00+07:00'), knockout: false, left: LeicesterCity, right: NewcastleUnited)
Match05 = Match.create(title: 'Match#05', description: 'EPL-32', start: DateTime.parse('2018-04-07T21:00:00+07:00'), knockout: false, left: StokeCity, right: TottenhamHotspur)
Match06 = Match.create(title: 'Match#06', description: 'EPL-32', start: DateTime.parse('2018-04-07T21:00:00+07:00'), knockout: false, left: Watford, right: Burnley)
Match07 = Match.create(title: 'Match#07', description: 'EPL-32', start: DateTime.parse('2018-04-07T21:00:00+07:00'), knockout: false, left: WestBromwichAlbion, right: SwanseaCity)
Match08 = Match.create(title: 'Match#08', description: 'EPL-32', start: DateTime.parse('2018-04-07T23:30:00+07:00'), knockout: false, left: ManchesterCity, right: ManchesterUnited)
Match09 = Match.create(title: 'Match#09', description: 'EPL-32', start: DateTime.parse('2018-04-08T20:15:00+07:00'), knockout: false, left: Arsenal, right: Southampton)
Match10 = Match.create(title: 'Match#10', description: 'EPL-32', start: DateTime.parse('2018-04-08T22:30:00+07:00'), knockout: false, left: Chelsea, right: WestHamUnited)




