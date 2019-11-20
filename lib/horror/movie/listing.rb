module Horror
	module Movie
		class Listing

			@@all = []

			def initialize(row)
				@row = row
				@@all << self
			end

			def rank
				@movie_rank = @row.css(".bold").text
			end

			def rating
				@movie_rating = @row.css(".tMeterScore").text.delete " " 
				#not a blank space, special character "tomatometer icon"
			end

			def movie_title
				@movie_title = @row.css(".unstyled.articleLink").text.strip
			end

			def movie_url
				@movie_url = @row.css(".unstyled.articleLink").attribute("href").value
				"https://www.rottentomatoes.com#{@movie_url}"
			end

			def number_of_reviews
				@number_of_reviews = @row.css(".right.hidden-xs").text
			end

			def movie_synopsis
				Horror::Movie::Scraper.new.movie_synopsis(self)
			end

			def self.all
        @@all
      end

      def self.find(id)
        self.all[id-1]
      end

		end
	end
end