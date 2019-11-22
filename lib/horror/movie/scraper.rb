require 'nokogiri'
require 'open-uri'
require 'colorize'

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
				rows[0..24].each do |row| 
					listing = Horror::Movie::Listing.new(row)
				end
			end

      def movie_info(movie)
      	Nokogiri::HTML(open(movie.movie_url))
      end
		end
	end
end

