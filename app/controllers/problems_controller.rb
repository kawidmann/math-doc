class ProblemsController < ApplicationController


	def index
		@new_problem = create_problem(new_rand(4, 1), new_rand(4), new_rand(2))
		
	end

	def create_problem(digits = 2, symb = :+, regrouping = true, max_factor = 12)
		#declaring the top and bottom halfs of the math problem
		top = 0
		bot = 0

		#case for randomizing the symbol.  Takes a random number and turns it into a math sign
		case symb
		when 0
			symb = :+
		when 1
			symb = :-
		when 2
			symb = :*
		when 3
			symb = :/
		end

		#case to randomize regrouping
		case regrouping
		when 0
			regrouping = true
		when 1
			regrouping = false
		end


		if symb == :/

			#if division get a new random number with a max of the value of max factor and a min of 2
			#get the other half by multiplying the bottom half and a new random number with a max of max factor and a min of 1
			#by multiplying all your answers will easy whole numbers

			bot = new_rand(max_factor, 2)

			top = bot * new_rand(max_factor, 1)


		elsif symb == :*

			#random top number with the correct number of digits
			#random bottom number with a max of max_factor

			digits.times { |i| top = top * 10 + new_rand }

			bot = new_rand(max_factor)
		

		else

			#else is for both addition and subtraction

			if regrouping

				#if regrouping is true then dont care about what the numbers are just get them to have enough digits

				digits.times do |i|
					top = top * 10 + new_rand
					bot = bot * 10 + new_rand
				end

			else

				#if regrouping is false

				if symb == :+

					#if addition get a new random number and add it to top
					#the max value of the bottom digit is 10 - the new random number so that it plus the top digit is less than 10

					digits.times do |i|
						x = new_rand
						top = top * 10 + x
						bot = bot * 10 + new_rand(10 - x)
					end
				else

					#else is for subtraction
					#get a new random number
					#add in into top as a new digit
					#the max value of the bot digit is less than top so theres no regrouping

					digits.times do |i|
						x = new_rand
						top = top * 10 + x
						bot = bot * 10 + new_rand(x)
					end
				end

			end

		end				

		#only check the numbers if the problem is addition or subtraction

		if symb == :+ || symb == :-

			#checks to see if the top number is more than the bottom number, top has the correct number of digits and bot has the correct number of digits minus 1
			#if the numbers pass then return all the numbers and the symbol in an array otherwise call the function again 

			check_nums(top, bot, digits) ? [top, bot, symb] : create_problem(digits, symb, regrouping)
		else

			#if multiplication or division return the numbers without checking
			#these problem types should have an unequal number of digits for the bottom number and would fail check_nums

			[top, bot, symb]
		end
	end

private

	#used to get random numbers
	#defaults to a max of 10
	#if the max number is 0 then dont create a new random number just return 0

	def new_rand(max = 10, min = 0)
		max == 0 ? max : Random.new.rand(min...max)
	end

	#checks that top is greater than bot, top has enough digit places, bot has enough digits or enough -1

	def check_nums(top, bot, digits)
		(top >= bot) && (top > 10 ** (digits - 1)) && (bot > 10 ** (digits - 2))
	end

end
