class ProblemsController < ApplicationController


	def index
		@new_problem = create_problem
	end

	def create_problem(digits = 1, symb = :+, regrouping = false)
		top = 0
		bot = 0
		if regrouping
			digits.times do |i|
				top = top * 10 + new_rand
				bot = bot * 10 + new_rand
			end			
		else
			if symb == :+
				digits.times do |i|
					x = new_rand
					top = top * 10 + x
					bot = bot * 10 + new_rand(10 - x)
				end
			else
				digits.times do |i|
					x = new_rand
					top = top * 10 + x
					bot = bot * 10 + new_rand(x)
				end
			end
		end

		check_nums(top, bot, digits) ? [top, bot, symb] : create_problem(digits, symb, regrouping)

	end

private

	def new_rand(max = 10)
		max == 0 ? max : Random.new.rand(max)
	end

	def check_nums(top, bot, digits)
		(top >= bot) && (top > 10 ** (digits - 1)) && (bot > 10 ** (digits - 2))
	end
	
end
