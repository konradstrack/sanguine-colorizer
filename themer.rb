require 'sinatra/base'
require 'sinatra/assetpack'
require 'zip'

require_relative 'theme_builder'

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

	get '/' do
		redirect to('/sanguine')
	end

	get '/sanguine' do
		erb :sanguine
	end

	get '/sanguine/download' do
		prefix = 'data/themes'
		theme_dir = 'Sanguine/openbox-3'
		
		colors = {
			base_color: params[:base],
			accent_color: params[:accent]
		}

		t = Tempfile.new ['sanguine', '.zip'], "#{settings.root}/tmp"
		Zip::File.open(t.path, Zip::File::CREATE) do |z|
			path = File.join(settings.root, prefix, theme_dir, '*.xbm')
			Dir[path].each do |file|
				dest_path = file.sub(/^#{Regexp.escape File.join(settings.root, prefix)}\/?/, '')
				z.add dest_path, file
			end

			z.get_output_stream(File.join(theme_dir, 'themerc')) do |trc|
				trc.write Sanguine.build_themerc(File.join(settings.root, prefix, theme_dir, 'themerc.erb'), colors)
			end
		end

		send_file t.path, :type => :zip	end
end
