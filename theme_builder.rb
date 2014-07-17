require 'erb'
require 'ostruct'
require_relative 'colors'

module Sanguine
	def self.build_themerc(themerc_erb_path, colors = {})
		c = { 
			base_color: '#232323', 
			accent_color: '#941919'
		}.merge(colors)

		base_c = Hex::Color.new(c[:base_color])
		accent_c = Hex::Color.new(c[:accent_color])

		opts = OpenStruct.new({
			base_color: base_c.to_s,
			accent_color: accent_c.to_s,
			lighter_accent_color: accent_c.to_s
		})

		template = open(themerc_erb_path, 'r') {|f| f.read}
		return ERB.new(template).result(opts.instance_eval {binding})
	end
end

