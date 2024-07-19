# @options_barber = ["Pinkman", "Viper", "Jesi", 'Jesi pinkman']

# @options_barber.each do |option|
#   puts option
# end

# require 'sqlite3'
# db = SQLite3::Database.new './public/contacts/tes.sqlite'
# db.execute "INSERT INTO barbers (barber, user, data_time, mails, color) VALUES ('Viper', 'Jesi', '2020-01-01',  'Jesi@', 'Blue')"


# db = SQLite3::Database.new './public/contacts/tes.sqlite'
# @contacts = db.execute "SELECT * FROM barbers"
# @contacts.each do |contact|

#   puts contact.inspect
#   puts contact
# end


# require 'sqlite3'
# db = SQLite3::Database.new 'barbershop.db'
# db.results_as_hash = true
# @contacts = db.execute "SELECT * FROM Users"
# puts @contacts
# @contacts.each do |contact|
#   puts contact
# end
	
# db.execute('select * from Barbers where name=?', [name]).length > 0

# db.execute 'SELECT * FROM Users' do |row|
# 	# print row['username']
#   # print row['phone']
#   print row['datestamp'].class
#   # puts db.class 
    
# end
# def seed_db db, barbers
	
# 	barbers.each do |barber|
# 		if !is_barber_exists? db, barber
# 			db.execute 'insert into Barbers (name) values (?)', [barber]
# 		end
# 	end	
# end


d = 4
if !d == 4
  puts 'ok'
end