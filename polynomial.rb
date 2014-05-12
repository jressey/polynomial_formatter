class Polynomial

	@coefficient_list

	PLUS = '+'
	MINUS = '-'

	def initialize(coefficients)
		raise ArgumentError, 'Need at least 2 coefficients' unless coefficients.size > 2
		@coefficient_list = coefficients
	end

	def to_s
		return '0' if ! @coefficient_list.any? { |c| c != 0 }
		@strang = String.new
		@coefficient_list.each_with_index do |c, i|
			if i != 0
				@strang += PLUS if c > 0
			end
			if c < 0 && i == 0 
				@strang += MINUS
			end
			if c != 0
				if c.abs != 1
					@strang += c.to_s 
				end 
				if i == @coefficient_list.size - 2  
					@strang += 'x' 
				elsif i != @coefficient_list.size - 1
					@strang += 'x^' + (@coefficient_list.size - (i + 1)).to_s
				end
			end
		end
		@strang.gsub!('--', '-')
		@strang
	end
end