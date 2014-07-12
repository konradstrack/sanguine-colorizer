require 'sinatra'

class SanguineThemer < Sinatra::Base
	get '/sanguine' do
		erb :sanguine
	end
end
