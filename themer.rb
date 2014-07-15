require 'sinatra/base'
require 'sinatra/assetpack'

class SanguineThemer < Sinatra::Base
	set :root, File.dirname(__FILE__)

	register Sinatra::AssetPack
	assets do
		serve '/css', from: 'app/css'
		serve '/js', from: 'app/js'
		serve '/images', from: 'app/images'

		css :application, '/css/application.css', [
			'/css/layout.css',
			'/css/sanguine.css'
		]

		js :application, '/js/application.css', [
			'/js/tinycolor.js',
			'/js/sanguine.js'
		]

		css_compression :sass
		js_compression :jsmin
	end

	get '/sanguine' do
		erb :sanguine
	end
end
