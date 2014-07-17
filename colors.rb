module Hex
	class Color
		def initialize(value)
			@color = value.is_a?(Numeric) ? value : hex(value)
		end

		def addh(value)
			Color.new([[@color+value, 0xffffff].min, 0].max)
		end

		def to_s
			"#%06x" % @color
		end

		private
		def hex(value)
			value.sub('#', '').hex
		end
	end
end
