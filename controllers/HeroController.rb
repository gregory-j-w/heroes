class HeroController < Sinatra::Base

	options '*' do
		response['Access-Control-Allow-Origin'] = '*'
		response['Access-Control-Allow-Headers'] = 'content-type'
		response['Access-Control-Allow-Methods'] = 'GET,POST,PATCH,DELETE'
		200
	end

	get '/' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		heroes = Hero.all.sort_by {|hero| hero.id}
		heroes.to_json
	end

	get '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		hero = Hero.find(id)
		hero.to_json
	end

	post '/' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		hero_info = JSON.parse(request.body.read)
		hero = Hero.new(hero_info)
		hero.save
		hero.to_json
	end

	patch '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		hero = Hero.find(id)
		hero_info = JSON.parse(request.body.read)
		hero.update_attributes(hero_info)
		hero.save
		heroes = Hero.all.sort_by {|hero| hero.id}
		heroes.to_json
	end

	delete '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		hero = Hero.find(id)
		hero.destroy
		heroes = Hero.all.sort_by {|hero| hero.id}
		heroes.to_json
	end

end
