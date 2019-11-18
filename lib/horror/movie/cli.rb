require "horror/movie/cli/version"

module Horror
  module Movie
    class Cli
      def welcome
      	Horror::Movie::Scraper.new.scrape_horror_movies
      	puts "Hello! Welcome to the Rotten Tomatoes: Top 20 Horror Movies List."
      	main_program
      end

    end
  end
end
