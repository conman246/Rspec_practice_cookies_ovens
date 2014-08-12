class Cookie 
	attr_reader :type, :baking_time
	attr_accessor :bake_time

	def initialize(type, baking_time)
		@type = type
		@baking_time = baking_time
		@bake_time = 0
	end

	# def bake_time
	# 	@bake_time
	# end

	# def bake_time=(new_time)
	# 	@bake_time = new_time
	# end

	def bake
		self.bake_time += 1
	end

	def status
		case 
		 when (baking_time - bake_time) > 1
		 	 :doughy
		 	when (baking_time - bake_time) < -1
		 	 :burnt
		 	else
		 	 :done	
		end 
	end
end



