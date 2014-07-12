require 'sinatra'

class SanguineThemer < Sinatra::Base
	get '/sanguine' do
		'Hello world!'
	end
end
