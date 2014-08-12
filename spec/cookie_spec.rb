require 'spec_helper'

# refactoring Rspec test code... 
# new Cookie object can be refactored using "let"......

  # ex: 
  	# Describe Dog do 
  	#   let(dog) { Dog.new }
  	# end

# let defines a helper method for us called "dog". 
# lazily evaluated and cached per example ( in other words...
	# When I run an example in my code, if I want to refer to dog,
	# I can invoke the dog helper method and it will run the code block and get a return value. 
	# then when I use that method again later, it will use the object it created originally. )


# using "let" to refactor Rspec test code... 
	# ex: 
	# describe "#run" do
	#   context "when tired" do 
	#     it "doesn't run" do
	#    	  dog.stub(:tired? => true)
	#       expected{dog.run}.to raise_error Dog::TooTired
	#     end
	#   end
	#    context "when not tired" do ... end
  #  end

	# (the above code sets :tired? to true without having to build up that feature in your tests)



describe Cookie do 
	# using let... 
	let(:cookie) { Cookie.new(:chocolate_chip, 10) } # create the method cookie and evaluate it as specified by the block

	describe "{#type}" do
		it "returns the cookie type" do 
			expect(Cookie.new(:chocolate_chip, 10).type).to eq :chocolate_chip # replace this with... 
		end

		it "recognizes peanut butter cookies" do 
			expect(Cookie.new(:peanut_butter, 10).type).to eq :peanut_butter 
		end
	end
  
  # using let...
	describe "#baking_time" do 
		it "returns the cookie ideal baking time" do 
			expect(cookie.baking_time).to eq 10  # this... (everwhere where there was/is Cookie.new(:chocolate_chip, 10))
		end

		it "recognizes a baking time of eight" do
			expect(Cookie.new(:chocolate_chip, 8).baking_time).to eq 8
		end
	end

	describe "#bake" do 
		it "increments the bake time of the cookie" do 

			expect { cookie.bake }.to change { cookie.bake_time }.by(1)
		end
	end

	describe "status " do
		it "reports when a cookie is underbaked" do 
			expect(cookie.status).to eq :doughy
		end

# using stub... 
		it "reports when a cookie has been properly baked" do
			cookie.stub(:bake_time => 10)
			expect(cookie.status).to eq :done
		end

# not using stub... 
		it "reports when a cookie has been baked too long" do 
			expect(Cookie.new(:chocolate_chip, -2).status).to eq :burnt
		end
	end
end



