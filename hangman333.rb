my_dict = ["jordan", "justin", "jennifer", "granite", "classical", "tutorials"] #creats a list of words to be used for the game.
user_guess = [] #is an array that will store the user's guess. Use this to print out their guesses at the end of the game.
user_name = ""
user_response = ""
hang_guess = "" #used to get users guess; will be pushed into other arrays for sorting, counting etc. A temporary value/placeholder
numb_guesses = 5 #is a variable holding the number of guesses allowed by the game/client.  If the requirements change, At any time this will allow us to change the maximum number of guesses.


def show_lost_part (total_wrong_guesses)

	case total_wrong_guesses
	when 1
		puts "That wrong guess has just cost you your left."
	when 2
		puts "You have lost your right arm. No waving at the crowd like a princess. "
	when 3
		puts "You lost your left leg."
	when 4
		puts "You lost your right leg. You literally have NO leg to stand on ;-) "
	when 5
		puts "You lost your head, You lost the game."
	end
end


def print_input user_response, random_word, user_guess
  	rand_word = random_word.chars
 	if rand_word.include?(user_response)
  	puts "Correct Guess!! \n"
  else
  	puts "Wrong Guess !!!! \n"
  	show_lost_part (user_guess-rand_word).length
  end
  	rand_word.each do |a|
  	if user_response == a
  		print user_response
  	elsif user_guess.include?(a)
  		print a
  	else
  		print "_"
  		end
  	end

  	print " ::::: User Guesses ->    "
		#prints to the screen a [ bracket followed by the user's guesses followed by a comma and ends with a square ]
  	puts "[" + user_guess.join(', ') + "]"

  if (  (user_guess-rand_word).length == 5   )
  	return 'lost'
  elsif (user_guess & rand_word.uniq).sort == rand_word.uniq.sort
  	return 'win'
  else
  	return 'continue'
  end
end






def is_y_n_q?(inp)
  inp == 'Y' || inp == 'y' || inp == 'N' || inp == 'n' ||  inp == 'Q' || inp == 'q'
end

#########################################################################
#### MAIN FUNCTION
#########################################################################

puts "Please enter your name."
user_name = gets.chomp
puts "Hi #{user_name}.  Would you like to play the hangman game?   If so, please enter Y for Yes or N for No"
user_response = gets.chomp

while (is_y_n_q?(user_response)) do
	if user_response == "y" || user_response == "Y"
	  random_word = my_dict[rand(6)]
	  puts "Awesome #{user_name}! Lets play hangman ;-).  Please enter a character"

	  user_response = gets.chomp
	  user_guess << user_response
	  game = print_input(user_response, random_word, user_guess)
	while (game == 'continue')
	  user_response = gets.chomp
	  if ( user_guess.include?(user_response) )
	  	puts "This charecter already entered as guess..."
	  else
	  	user_guess << user_response
	  	game = print_input(user_response, random_word, user_guess)
	  end

	  if ( game == 'lost')
	  	puts "Sorry!  You have guessed incorrectly five times.  You lose the game!!"
	  elsif ( game == 'win')
	  	puts "Winner!!!"
	  end
	end
	elsif user_response == 'n' || user_response == 'N'
		  puts "Okay Bye!!!"
		  break
	end
	puts "Would you like  to play again ? [y]yes/[n]No"
	user_response = gets.chomp
end
