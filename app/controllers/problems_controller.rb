class ProblemsController < ApplicationController
	before_action :get_user


	def index

		@problems = []

		@problems = Problem.where(user_id: @user.id, date: "#{Time.new.month}/#{Time.new.day}/#{Time.new.year}")


		if @problems.empty?
			problem_problem_types = {addition: @user.addition, subtraction: @user.subtraction, multiplication: @user.multiplication, division: @user.division,
				numbers_identifying: @user.numbers_identifying, numbers_counting: @user.numbers_counting, numbers_rote_counting: @user.numbers_rote_counting,
				word_problems: @user.word_problems, word_problems_addition: @user.word_problems_addition, word_problems_subtraction: @user.word_problems_subtraction, word_problems_multiplication: @user.word_problems_multiplication, word_problems_division: @user.word_problems_division,
				multi_step: @user.multi_step, multi_step_word_problems: @user.multi_step_word_problems,
				money_identifying_coins: @user.money_identifying_coins, money_identifying_bills: @user.money_identifying_bills, money_addition: @user.money_addition, money_change: @user.money_change, money_enough: @user.money_enough,
				telling_time: @user.telling_time, time_elapsed: @user.time_elapsed}.keep_if { |key, value| value }.keys
			problem_problem_types.each do |x| 
					Problem.create(date: "#{Time.new.month}/#{Time.new.day}/#{Time.new.year}", problem_type: x, user_id: @user.id)
				end			
		end

		@problems.each do |x|
			if x.total <= 5
				create_problem(x.problem_type)
			end
		end
		
		
	end

	def welcome
		if user_signed_in?
			redirect_to problems_path
		end
	end

	def settings
	end

	def create_problem(problem_type = :addition, digits = 2, sign = :+, grouping = true, max_factor = 12)
		#setting up digits, grouping, and max factor based on the user
		problem_type = problem_type.to_sym
		#declaring the top and bottom halfs of the math problem
		top = 0
		bot = 0

		#case for randomizing the signol.  Takes a random number and turns it into a math sign
		#also sets up the problem_type based on the sign

		case sign
		when 0
			sign = :+
		when 1
			sign = :-
		when 2
			sign = :*
		when 3
			sign = :/
		end

		case problem_type
		when :addition
			sign = :+
			digits = @user.addition_digits
			grouping = @user.addition_grouping
		when :subtraction
			sign = :-
			digits = @user.subtraction_digits
			grouping = @user.subtraction_grouping
		when :multiplication
			sign = :*
			digits = @user.multiplication_digits
			max_factor = @user.multiplication_max_factor
		when :division
			sign = :/
			max_factor = @user.division_max_factor
		when :numbers_identifying

		when :numbers_counting

		when :numbers_rote_counting

		when :word_problems

		when :word_problems_addition

		when :word_problems_subtraction

		when :word_problems_multiplication

		when :word_problems_division

		when :multi_step

		when :multi_step_word_problems

		when :money_identifying_coins

		when :money_identifying_bills

		when :money_addition

		when :money_change

		when :money_enough

		when :telling_time

		when :time_elapsed

		end




		#case to randomize grouping
		case grouping
		when 0
			grouping = true
		when 1
			grouping = false
		end


		if sign == :/

			#if division get a new random number with a max of the value of max factor and a min of 2
			#get the other half by multiplying the bottom half and a new random number with a max of max factor and a min of 1
			#by multiplying all your answers will easy whole numbers

			bot = new_rand(max_factor, 2)

			top = bot * new_rand(max_factor, 1)


		elsif sign == :*

			#random top number with the correct number of digits
			#random bottom number with a max of max_factor

			digits.times { |i| top = top * 10 + new_rand }

			bot = new_rand(max_factor)
		

		else

			#else is for both addition and subtraction

			if grouping

				#if grouping is true then dont care about what the numbers are just get them to have enough digits

				digits.times do |i|
					top = top * 10 + new_rand
					bot = bot * 10 + new_rand
				end

			else

				#if grouping is false

				if sign == :+

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
					#the max value of the bot digit is less than top so theres no grouping

					digits.times do |i|
						x = new_rand
						top = top * 10 + x
						bot = bot * 10 + new_rand(x)
					end
				end

			end

		end				

		#only check the numbers if the problem is addition or subtraction

		if sign == :+ || sign == :-

			#checks to see if the top number is more than the bottom number, top has the correct number of digits and bot has the correct number of digits minus 1
			#if the numbers pass then return all the numbers and the signol in an array otherwise call the function again 

			check_nums(top, bot, digits) ? [top, bot, sign, problem_type] : create_problem(digits, sign, grouping, max_factor)
		else

			#if multiplication or division return the numbers without checking
			#these problem problem_types should have an unequal number of digits for the bottom number and would fail check_nums

			[top, bot, sign, problem_type]
		end
	end

	def get_user
		@user = current_user
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
