require 'nokogiri'
require 'open-uri'

#distinct from other parts of the program, i.e. module Horror: everything is related to horror.
#class Scraper = object that does all of the scraping for us.
#def initialize has rotten tomatoes as default to scrape
#@site & @doc belong to the instance of scraper
module Horror
	module Movie
		class Scraper
			def initialize
				@site = "https://www.rottentomatoes.com/top/bestofrt/top_100_horror_movies/"
				@doc = Nokogiri::HTML(open(@site))
			end

			def scrape_horror_movies
				rows = @doc.css("table.table tr")
				rows.shift
				rows[0 .. 24].each do |row| 
					listing = Horror::Movie::Listing.new(row)
				end
			end

      def movie_info(movie)
      	Nokogiri::HTML(open(movie.movie_url))
      end

		end
	end
end

