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
      	puts " Hello! Welcome to the Rotten Tomatoes: Top 25 Horror Movies List."
      	puts ""
      	main_program
      end

      def main_program

      	print_movies

        puts ""
		    puts "Would you like further information on a movie?"
		    puts ""
		    puts "If yes, please enter a number."
		    puts "If not, please enter no."
		    puts ""
		    input = gets.strip
		    if input.downcase == "no"
		    	goodbye
		    end


		    movie = Horror::Movie::Listing.find(input.to_i)

		    print_movie(movie)

		    puts ""
		    puts "Would you like to see the movie summary and a random review?"
		    puts ""
		    puts "Please enter yes or no."
		    puts ""

		    input = gets.strip.downcase
		    if input == "yes"
		      print_movie_info(movie)
		    end

		    puts ""
		    puts "Would you like to see information on another movie?"
		    puts ""
		    puts "Please enter yes or no."
		    puts ""

		    input = gets.strip.downcase
		    if input == "yes"
		      main_program
		    elsif input == "no"
		    	goodbye
		    else
		      puts ""
		      puts "I don't understand that answer."
		      puts ""
		      main_program
		    end
		  end

      def print_movie(movie)
		    puts ""
		    puts "Rank:                         #{movie.rank}"
		    puts "Rating:                       #{movie.rating}"
		    puts "Movie Title:                  #{movie.movie_title}"
		    puts "Movie Url:                    #{movie.movie_url}"
		    puts "Number of Reviews:            #{movie.number_of_reviews}"
		    puts ""
      end

      def print_movie_info(movie)
      	movie_info = movie.movie_info
		    puts ""                     
      	puts "---------------Movie Synopsis--------------"
		    puts ""
		    puts "#{movie_info.movie_synopsis}"
		    puts ""
		    puts ""
		    puts "---------------Random Review---------------"
		    puts ""
		    puts "#{movie_info.movie_review}"
		    puts ""
		    puts "-------------------------------------------"
		    puts ""
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
	      puts "Thank you for your interest. Have a spooky day!".colorize :green
	      puts ""
	      puts ""
	    	puts File.read("lib/horror/movie/skull.txt").colorize :green
	    	puts ""
	    	puts ""
	      exit
      end
    end
  end
end
