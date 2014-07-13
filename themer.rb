require 'sinatra/base'
require 'sinatra/assetpack'

class SanguineThemer < Sinatra::Base
	set :root, File.dirname(__FILE__)

	register Sinatra::AssetPack
	assets do
		serve '/css', from: 'app/css'

		css :application, '/css/application.css', [
			'/css/layout.css',
			'/css/sanguine.css'
		]

#		css_compression :sass
	end

	get '/sanguine' do
		erb :sanguine
	end
end
