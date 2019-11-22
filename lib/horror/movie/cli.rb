#require "horror/movie/version"
require_relative "../movie/scraper.rb"
require_relative "../movie/listing.rb"
require_relative "../movie/info.rb"

module Horror
  module Movie
    class Cli
      def welcome
      	Horror::Movie::Scraper.new.scrape_horror_movies
      	puts File.read("lib/horror/movie/intro.txt").colorize :green
      	puts ""
      	puts "Hello! Welcome to the Rotten Tomatoes: Top 25 Horror Movies List."
      	puts ""
      	main_program
      end

      def main_program

      	print_movies

        puts "------------------------------------------------"
        puts ""
		    puts "Would you like further information on a movie?"
      	puts ""
      	puts "------------------------------------------------"
		    puts "If yes, please enter a number 1-25."
		    puts "If not, please enter no."
		    puts ""

		    movie = correct_number?

		    puts "------------------------------------------------"
		    puts "Would you like to see the movie's summary and a random review?"
		    puts ""
		    puts "Please enter yes or no."
		    puts ""

		    summary_and_review?(movie)

		    puts ""
		    puts "Would you like to see information on another movie?"
		    puts ""
		    puts "Please enter yes or no."
		    puts ""

		    another_movie?
		  end

		  def correct_number?
		  	input = gets.strip
		  	until input.downcase == "no" || (1..25).include?(input.to_i)
		  		puts ""
		  	  puts "------------------------------------------------"
		  	  puts "Invalid answer."
		  	  puts ""
		  	 	input = gets.strip
		  	end
		  	if (1..25).include? input.to_i
		  		movie = Horror::Movie::Listing.find(input.to_i)
					print_movie(movie)
					return movie
				elsif input.downcase == "no"
					goodbye
				end
			end


		  def summary_and_review?(movie)
		  	input = gets.strip.downcase
		  	until input == "yes" || input == "no"
		  	  puts ""
		  	  puts "------------------------------------------------"
		  	  puts "Invalid answer."
		  	  puts ""
		  	 	input = gets.strip.downcase
		  	end
		    if input == "yes"
		      print_movie_info(movie)
		    end
		  end

		  def another_movie?
		    input = gets.strip.downcase
		  	until input == "yes" || input == "no"
		  	  puts ""
		  	  puts "------------------------------------------------"
		  	  puts "Invalid answer."
		  	  puts ""
		  	 	input = gets.strip.downcase
		  	end
		    if input == "yes"
		      main_program
		    elsif input == "no"
		    	goodbye
		    end
		  end

      def print_movie(movie)
      	puts ""
		    puts "---------------- Movie Stats ---------------"
		    puts ""
		    puts "Rank:                    #{movie.rank}"
		    puts "Rating:                  #{movie.rating}"
		    puts "Movie Title:             #{movie.movie_title}"
		    puts "Movie Url:               #{movie.movie_url}"
		    puts "Number of Reviews:       #{movie.number_of_reviews}"
		    puts ""
      end

      def print_movie_info(movie)
      	movie_info = movie.movie_info
		    puts ""                     
      	puts "---------------- Movie Synopsis ---------------"
		    puts ""
		    puts "#{movie_info.movie_synopsis}"
		    puts ""
		    puts "---------------- Random Review ----------------"
		    puts ""
		    puts "#{movie_info.movie_review}"
		    puts ""
		    puts "------------------------------------------------"
      end

      def print_movies
		    puts ""
		    puts "---------- Rotten Tomatoes: Top 25 Horror Movies ----------"
		    puts ""
		    Horror::Movie::Listing.all.each.with_index do |movie, index|
	        puts "#{index + 1}. #{movie.movie_title}"
	      end
      end

      def goodbye
	      puts ""
	      puts "------------------------------------------------".colorize :green
	      puts "Thank you for your interest. Have a spooky day!".colorize :green
	      puts ""
	      puts ""
	    	puts File.read("lib/horror/movie/skull.txt").colorize :green
	    	puts ""
	    	puts "------------------------------------------------".colorize :green
	      exit
      end
    end
  end
end

