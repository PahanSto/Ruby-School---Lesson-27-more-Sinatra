
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

hh2 = ['jesi', 'viper', 'pinkman', 'Jesi pinkman', 'Pahan']

# def is_barber_exists? db, name
# 		db.execute('select * from Barbers where name=?', [name]).length > 0
# end

def is_barber_exists? db, name
	query = 'SELECT * FROM Barbers WHERE name = ?'
	result = db.execute query, [name]
	if result.length > 0
			return true
	else
			return false
	end
end

def get_db
	db = SQLite3::Database.new 'barbershop.db'
	db.results_as_hash = true
	return db
	
end




def seed_db db, barbers
	
	barbers.each do |barber|
		if !is_barber_exists? db, barber
			db.execute 'insert into Barbers (name) values (?)', [barber]
		end
	end	
end

configure do
	db = get_db
	db.execute 'CREATE TABLE IF NOT EXISTS
		"Users"
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT,
			"username" TEXT,
			"phone" TEXT,
			"datestamp" TEXT,
			"barber" TEXT,
			"mails" TEXT,
			"color" TEXT
		)'
		db.execute 'CREATE TABLE IF NOT EXISTS
		"Barbers"
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT,
			"name" TEXT
		)'
	seed_db db, hh2	
end



before  do
	# @options_barber = ["Pinkman", "Viper", "Jesi", 'Jesi pinkman']

	# @selected_barber = params[:barber]
		db = get_db
		@options_barber = db.execute 'select * from Barbers'

end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	@error = 'Что-то пошло не так'
	erb :about
end



get '/contacts' do
	db = get_db
	@contacts = db.execute "SELECT * FROM Users"
	erb :contacts

end

get '/visit' do
	erb :visit
end


post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@mail = params[:mail]
	@barber = params[:barber]
	@color = params[:color]
	@mess = ''
	
	hh = {
				:username => 'Введите имя', 
				:phone => 'Введите телефон', 
				:mail => 'Введите электронную почту',
				:datetime => 'Введите дату'
				
			}
	
	@error = hh.select {|key, value| params[key] == ''}.values.join(', ')

	if @error != ''
		return erb :visit
	end

	
	
	

	db = get_db
	db.execute "INSERT INTO Users 
	(
		username, 
		phone, 
		datestamp, 
		barber, 
		mails,
		color
	) 
	VALUES (?, ?, ?, ?, ?, ?)", [@username, @phone, @datetime, @barber, @mail, @color]
	
	
	redirect request.referrer
	
	
	erb "<h2>Спасибо, вы записались!</h2>"
	
end


get '/showers' do
	erb :showers
	
end


	