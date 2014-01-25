class Book
	def title=(title)
		@title=
		title.gsub(/\w+/) do |word|
			if ["and","in","of","the","a","an"].include?(word)
				word
			else
				word.capitalize
			end
		end
		@title=@title.gsub(/^\w+/) {|word| word.capitalize}
	end

	def title
		@title
	end
end