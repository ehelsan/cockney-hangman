class Hangman

    def initialize
        @letters = ('a'..'z').to_a
        @word = words.sample
        @lives = 7
        @word_teaser = ""

        @word.first.size.times do
            @word_teaser += "_ "
        end 
    end

    def words
        [
            ["throat", " 'I've got a sore BILLY GOAT'"],
            ["cough", " 'That's a nasty old BORIS you've got there son'"],
            ["favour", " 'Do us a CHEESY will ya?'"],
            ["knackered", " 'I'm CREAM CRACKERED, mate'"],
            ["scar", " 'I fell down the apple and pears trying to answer the dog & bone, hit my head and ended up with a MARS BAR'"],
            ["ghost", " 'He alright? Looks like he's seen a PILLAR'"],
            ["stranger", " 'Who's that QUEEN'S PARK RANGER standing over there?'"],
            ["talking", " 'He's always RABBITTING on about something'"],
            ["gossip", " 'What's the latest REX, love?' , - Rex Mossop is an Australian sports commentator'"],
            ["party", " 'I've phoned for a sherbert to take us to the RUSSELL , - Russell Harty is a TV host"],
            ["dictionary", " 'I'll just check the meaning in the Tom' (Tom, Dick and Harry)"]

        ]
    end


    def print_teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
    end

    
    def update_teaser last_guess
        new_teaser = @word_teaser.split

        new_teaser.each_with_index do |letter, index|
            #replace blank values with guessed letter if it matches a letter in the word
            if letter == '_' && @word.first[index] == last_guess
                new_teaser [index] = last_guess
            end 
        end

        @word_teaser = new_teaser.join( ' ')
    end

    def make_guess
        if @lives > 0
            puts " "
            puts "Why don't ya enter a letter mate?"
            puts "REMEMBER cockney slang sometimes rhymes with the original word it's derived from"
            puts " "
            guess = gets.chomp

            # if the letter is not part of word then remove from letters array
            good_guess = @word.first.include? guess

            if guess == "exit"
                puts "Thanks for playing mate, 'twas a pleasure"
            elsif good_guess
                puts " "
                puts "Good guess guvnor! You're correct"

                print_teaser guess

                if @word.first == @word_teaser.split.join
                    puts " "
                    puts "Well you're a right ol' Einstein ain't ya. Congrats!"
                else
                    make_guess
                end
            else
                @lives -= 1  
                puts "Sorry... gotta try again luv! You have #{ @lives } lives left"
                make_guess

            end 
        else
            puts "Game over."            
        end
    end

    def begin
        puts " "
        puts "New game afoot geezer, your aim is to translate the word in all caps... your word is #{ @word.first.size } characters long"
        puts " "
        puts "To exit the game at any point, type 'exit' "
        print_teaser
        puts " "
        puts "Clue: #{ @word.last }"

        make_guess

    end
end

game = Hangman.new
game.begin