# Problem: Pig Latin
# Pig Latin
 # "apple" => "appleay"
 # "plum" => "umplay"
 # grape => apegray
 # Natalie => atalieNay
 # bonus: "squeeze" => "eezesquay"

# Plan
# input a word
# find first vowel
# takes all the stuff from before that first vowel
# put that stuff at the end of the string in the same order
# then add "ay"

# word = get_user_input
user_word = gets.chomp
# vowels = ["a","e","i","o","u"]
# define function pig_latinify(word)
def pig_latinify(word)
  vowels = ["a","e","i","o","u"]
#   letters = word.to_array
  letters = word.chars
#   first_vowel = first_occurrence(letters, vowels)
  first_vowel = first_occurrence(letters, vowels)
#   stuff_before_first_vowel = letters.up_until(first_vowel, letters)
  stuff_before_first_vowel = up_until(first_vowel, letters)
#   letters = letters.remove(stuff_before_first_vowel)
#   letters = letters.delete(stuff_before_first_vowel)
    # while letter isn't first_vowel
    letter = letters.first
    while letter != first_vowel
      letters << letter
      letters.shift
      letter = letters.first
    end
    # plum p
    # lum l
    # um u

#   new_word = letters + stuff_before_first_vowel
#   new_word = new_word + "ay"
    letters << "ay"
#   pig_latin_word = new_word.to_string
    pig_latin_word = letters.join("")
#   return pig_latin_word
    return pig_latin_word
# end function
end

# up_until("a", ["z", "y", "a", "b", "c"]) -> ["z", "y"]
# up_until("a", ["g", "r", "a", "p", "e"]) -> ["g", "r"]
# define function up_until(some_letter, letters)
def up_until(some_letter, letters)
  # starting_letters = []
  starting_letters = []
  # for every letter in letters
  position = nil
  letters.each do |letter|
    # if letter == some_letter
    if letter == some_letter
    #   position = current_position
      position = letters.index(letter)
    end
  end

  # for each current_position in letters
  # .each_with_index |index, element|
  letters.each_index do |current_position|
    if current_position < position
    # starting_letters.add(current_letter)
      starting_letters  << letters[current_position]
    end
  end

  # returns all letters before some_letter in word
  # return starting_letters
  return starting_letters
# end
end

# first_occurrence(["t", "a", "b", "c"], ["a", "e", "i", "o", "u"]) -> "a"
# first_occurrence(["g", "r", "a", "p", "e"], ["a", "e", "i", "o", "u"]) -> "a"
# define function first_occurrence(letters, vowels)
def first_occurrence(letters, vowels)
#   for each letter in letters
  letters.each do |letter|
    # for each vowel in vowels
    if vowels.include?(letter)
      return letter
    end
    # the long way:
    # vowels.each do |current_vowel|
    #   # check if letter == current_vowel
    #   if letter == current_vowel
    #     return vowel
    #   end
    # end
  end
end

result = pig_latinify(user_word)
puts result

