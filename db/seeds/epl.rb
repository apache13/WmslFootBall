# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Config.destroy_all
Config.create(key: 'TITLE_STRING',value: 'WMSL EPL 2017-2018')
Config.create(key: 'CLOSE_REGISTER_DATETIME',value: '2018-03-31T18:30:00+07:00')

Bet.destroy_all
Group.destroy_all
Team.destroy_all
User.destroy_all
Match.destroy_all

Tester01 = User.create(provider: 'facebook', uid: '1735656219789615', name: 'Ohm Narawat', email: 'narawat777@gmail.com', image: 'http://graph.facebook.com/v2.6/1735656219789615/picture', admin: false)
Tester02 = User.create(provider: 'facebook', uid: '10155924626118820', name: 'Cat Oraphanthong', email: 'to_be_cat@hotmail.com', image: 'http://graph.facebook.com/v2.6/10155924626118820/picture', admin: false)
Tester03 = User.create(provider: 'facebook', uid: '1853148911385862', name: 'Kengkote Kote', email: 'kengkote@hotmail.com', image: 'http://graph.facebook.com/v2.6/1853148911385862/picture', admin: false)
Tester04 = User.create(provider: 'facebook', uid: '1695051147226674', name: 'Sutthisak Srimahakosol', email: 'mardnakub@hotmail.com', image: 'http://graph.facebook.com/v2.6/1695051147226674/picture', admin: false)

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

Match01 = Match.create(title: 'Match#01', description: 'EPL-32', start: DateTime.parse('2018-03-31T18:30:00+07:00'), knockout: false, left: CrystalPalace, right: Liverpool)
Match02 = Match.create(title: 'Match#02', description: 'EPL-32', start: DateTime.parse('2018-03-31T21:00:00+07:00'), knockout: false, left: BrightonAndHoveAlbion, right: LeicesterCity)
Match03 = Match.create(title: 'Match#03', description: 'EPL-32', start: DateTime.parse('2018-03-31T21:00:00+07:00'), knockout: false, left: ManchesterUnited, right: SwanseaCity)
Match04 = Match.create(title: 'Match#04', description: 'EPL-32', start: DateTime.parse('2018-03-31T21:00:00+07:00'), knockout: false, left: NewcastleUnited, right: HuddersfieldTown)
Match05 = Match.create(title: 'Match#05', description: 'EPL-32', start: DateTime.parse('2018-03-31T21:00:00+07:00'), knockout: false, left: Watford, right: Bournemouth)
Match06 = Match.create(title: 'Match#06', description: 'EPL-32', start: DateTime.parse('2018-03-31T21:00:00+07:00'), knockout: false, left: WestBromwichAlbion, right: Burnley)
Match07 = Match.create(title: 'Match#07', description: 'EPL-32', start: DateTime.parse('2018-03-31T21:00:00+07:00'), knockout: false, left: WestHamUnited, right: Southampton)
Match08 = Match.create(title: 'Match#08', description: 'EPL-32', start: DateTime.parse('2018-03-31T21:00:00+07:00'), knockout: false, left: Everton, right: ManchesterCity)
Match09 = Match.create(title: 'Match#09', description: 'EPL-32', start: DateTime.parse('2018-04-01T19:30:00+07:00'), knockout: false, left: Arsenal, right: StokeCity)
Match10 = Match.create(title: 'Match#10', description: 'EPL-32', start: DateTime.parse('2018-04-01T22:00:00+07:00'), knockout: false, left: Chelsea, right: TottenhamHotspur)



