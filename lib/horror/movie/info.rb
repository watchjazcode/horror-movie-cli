module Horror
	module Movie
		class Info

			def initialize(doc)
				@doc = doc
			end

			def movie_synopsis
				@movie_synopsis = @doc.css("#movieSynopsis").text.strip
			end

			def movie_review
				reviews = []
				@doc.css(".quote_bubble__quote p").each do |review|
					reviews << review.text.strip
				end
				reviews.sample
			end
		end
	end
end