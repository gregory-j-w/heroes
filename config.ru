require 'bundler'
Bundler.require

require './models/HeroModel'

require './controllers/HeroController'

run Sinatra::Application

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'super'
)

map('/heroes'){run HeroController}