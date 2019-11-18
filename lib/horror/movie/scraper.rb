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
				@doc.css("table.table tr").each do |row| 
					movie_rank = row.css(".bold").text
					movie_rating = row.css(".tMeterScore").text
					movie_rating.delete! " " #not a blank space, actually a special tomatometer character.
					movie_title = row.css(".unstyled.articleLink").text.strip
					movie_url = row.css(".unstyled.articleLink").attribute("href").value
					number_of_reviews = row.css(".right.hidden-xs").text
					#to do create new instance of a movie

				end
			end



		end
	end
end

  #puts doc

 #things = doc.css("table.table tr")
 #things.shift

 #puts things.count