Prize.destroy_all

match_01 = Match.all.first
match_02 = Match.all.last

prize_01 = Prize.create(name: 'aaa', code: '001', description: '', sponsor: 'a', price: 10.00, match: match_01)
prize_02 = Prize.create(name: 'bbb', code: '002', description: '', sponsor: 'b', price: 20.00, match: match_01)
prize_03 = Prize.create(name: 'ccc', code: '003', description: '', sponsor: 'c', price: 30.00, match: match_01)
prize_04 = Prize.create(name: 'ddd', code: '004', description: '', sponsor: 'd', price: 40.00, match: match_01)
prize_05 = Prize.create(name: 'eee', code: '005', description: '', sponsor: 'e', price: 50.00, match: match_01)
prize_06 = Prize.create(name: 'fff', code: '006', description: '', sponsor: 'f', price: 60.00, match: match_02)
prize_07 = Prize.create(name: 'ggg', code: '007', description: '', sponsor: 'g', price: 70.00, match: match_02)
prize_08 = Prize.create(name: 'hhh', code: '008', description: '', sponsor: 'h', price: 80.00, match: match_02)
prize_09 = Prize.create(name: 'iii', code: '009', description: '', sponsor: 'i', price: 90.00, match: match_02)
prize_10 = Prize.create(name: 'jjj', code: '010', description: '', sponsor: 'j', price: 100.00, match: match_02)