class Temperature
	attr_accessor :f, :c
	def initialize(hash={})
		@f=hash[:f]
		@c=hash[:c]
	end

	def in_fahrenheit
		if @c.nil?
			@f
		else
			9*@c/5.0 +32
		end
	end

	def in_celsius
		if @f.nil?
			@c
		else
			(@f-32)*5/9.0
		end
	end

	def self.from_celsius(temp)
		return Temperature.new(c: temp)
	end

	def self.from_fahrenheit(temp)
		return Temperature.new(f: temp)
	end
end

class Celsius < Temperature
	def initialize(c)
		@c=c
	end
end

class Fahrenheit < Temperature
	def initialize(f)
		@f=f
	end
end