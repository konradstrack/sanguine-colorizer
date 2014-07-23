require 'erb'
require 'ostruct'
require_relative 'colors'

module Sanguine
	def self.build_themerc(themerc_erb_path, colors = {})
		c = { 
			base_color: '#232323', 
			accent_color: '#941919'
		}.merge(colors)
		p "!" * 100
		p c
		p colors

		base_c = Hex::Color.new(c[:base_color])
		accent_c = Hex::Color.new(c[:accent_color])

		opts = OpenStruct.new({
			base_color: base_c.to_s,

			accent_color: accent_c.to_s,
			darker_accent_color: accent_c.addh(-0x191919).to_s,

			menu_separator_color: base_c.addh(0x0d0d0d).to_s,
			menu_title_color: base_c.addh(0x0d0d0d).to_s,

			active_border_color: base_c.addh(-0x0b0b0b).to_s,
			inactive_border_color: base_c.to_s,

			lighter_g1_color: base_c.addh(0x131313).to_s,
			lighter_g2_color: base_c.addh(0x0e0e0e).to_s,

			darker_g1_color: base_c.to_s,
			darker_g2_color: base_c.addh(-0x0b0b0b).to_s
		})

		template = open(themerc_erb_path, 'r') {|f| f.read}
		return ERB.new(template).result(opts.instance_eval {binding})
	end
end

