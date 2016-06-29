my_dict = ["jordan", "justin", "jennifer", "granite", "classical", "tutorials"] #creats a list of words to be used for the game.
#Use the position fo the array to determine the word
random_word = my_dict[rand(6)]
rand_word = random_word.split(//)   # assign a new variable to hold the characters of the randomly generated word. This will allow you to run comparisons on the word. The // tells Ruby to split the array into characters.
user_guess = [] #is an array that will store the user's guess. Use this to print out their guesses at the end of the game.
wrong_guesses = 0  # counts the number of guesses a user has made
user_name = ""
user_response = ""
hang_guess = "" #used to get users guess; will be pushed into other arrays for sorting, counting etc. A temporary value/placeholder
numb_guesses = 5 #is a variable holding the number of guesses allowed by the game/client.  If the requirements change, At any time this will allow us to change the maximum number of guesses.

def guess(rand_word)
  puts "enter a letter"
  letter = gets.chomp.downcase
  display_word(rand_word,letter)
end

def display_word(r_word, game_guess) #Ava's method created in class with Instructor.  Will display the guessed characters in order
  mask_word = ""
  r_word.chars.each do |char|
    if game_guess.include?(char)
      mask_word += char
    else
      mask_word += "_"
    end
  return mask_word
 end
end

def is_y_n_q?(inp)
  inp == 'Y' || inp == 'y' || inp == 'N' || inp == 'n' ||  inp == 'Q' || inp == 'q'
end

#These methods are created so I can include them in the response to the user. Should make it a litle interesting ;-)
def right_leg(g_tally)
  if g_tally == 1
   puts "you have lost your right leg"
 end
end

def left_leg(g_tally)
  if g_tally == 2
   puts "You have lost your left leg. You have no leg to stand on, no pun intended. Well, maybe ~ just a little"
 end
end

def right_arm(g_tally)
  if g_tally == 3
   puts "You have lost your right arm.  No more waving at the crowds as if you are a prima donna or don ;-) "
 end
end

def left_arm(g_tally)
  if g_tally == 4
   puts "You have lost your left arm.  You are dangerously close to losing your HEAD!!  Keep your cool ;-). Choose your next character wisely. "
 end
end

def head(g_tally)
  if g_tally  == 5
   puts "You have lost your head and the game. Better luck next time"
 end
end


#########################################################################
#### MAIN FUNCTION
#########################################################################

puts "Please enter your name."
user_name = gets.chomp
puts "Hi #{user_name}.  Would you like to play the hangman game?   If so, please enter Y for Yes or N for No"
user_response = gets.chomp

while (is_y_n_q?(user_response)) do
  puts "\n Please \t enter a \t valid response."
  user_response = gets.chomp

 if user_response.downcase == "y"
   puts " Great!  #{user_name}, We are going to have so much fun with this game. I have selected a word.  The objective /n is for you to guess the word within #{numb_guesses} guesses.  Let's get started. Please enter one letter now."

   #game code
   puts "Awesome! I am so excited that you want to play my little game.  Let's get /n
   a few housekeeping items out of the way. You should note you are playing a guessing. /n
   which is to say I have a much better chance at winning; however, don't be deterred, as I am also /n
   a new Rubyist and will likely screw up this code giving you the advantage.  To play the game you will
   enter a random character. I will check if you have already entered it and if it exists the
   the word you are attempting to guess.  If either of the above are false, you will lose a
   body part. You may lose a maximum of five body parts. If you lose five body parts, you lose the game.
   Let's get started!  Please enter a character"

   user_response = gets.chomp
 end
  #Get user guess, verify its one character and then verify if it is in the array.

  while wrong_guesses <= numb_guesses do #
   if hang_guess.length > 1
     hang_guess.length.push(hang_guess)+1
     wrong_guesses = wrong_guesses+1 #keeps ongoing tally of users wrong guess.
     puts "You have entered too many chacters.  Please enter one character.  Please try again."
     hang_guess = gets.chomp

     #Starts the testing of the game . User has entered one character

   elsif   #user guesses correctly
     random_word.split(//).include?(hang_guess) #.....remember hang_guess is a temporary.  hecks user guess against the characters in the array. (//) splits into characters
     hang_guess.push(user_guess) #if the users guess is included in the random word, then push the value into this array.
     #user_guess.push(hang_guess) #push hang_guess into user_guess. Use user_guess from now on.
     #tally users guesses
     puts "Great guess! You have guessed #{user_guess}.  Please enter another guess"
     hang_guess = gets.chomp
     #user_guess != random_word.split(//).include?(user_guess) - can't remember what I was going to use this code for.

     right_leg(user_guess)
     left_leg(user_guess)
     right_leg(user_guess)
     left_leg(user_guess)
     head(user_guess)

   #part of the Verify if the user wants to play a game 'If' statement that appears above.
   elsif
     puts "You have indicated you do not wish to play the guessing game. The game knows you do not wish to play and therefore
     no longer has to guess your intentions.  If you change your mind, you are on your own, as I am not goign to tell
     you how to restart the game. It has a lot to do with the fact that I don't think I myself know how to reloop this.
       I am off to play with someone who enjoys the unknown. Ideally, "
       #ask the user to renter their response.  Need to loop back

   else
       puts "You have entered a key that is neither Y or N. Please enter a proper response"
       #I still need to test the vailidity of the input and repeat the test.  Method?  How do I do this?
   end
  end
end
