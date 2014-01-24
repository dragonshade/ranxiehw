def echo(str)
	return str
end

def shout(str)
	return str.upcase
end

def repeat(str,num=2)
	if num==1
		return str
	else
		return str+" "+repeat(str,num-1)
	end
end

def start_of_word(word,num)
	i=0
	start=""
	while i<num
		start+=word[i]
		i+=1
	end 
	return start
end

def first_word(sentence)
	sentence.split(" ")[0]
end

def titleize(sentence)
	 cap_sentence=
		 sentence.gsub(/\w+/).each do |word|
		 	if not ["and","the","of","over"].include?(word)
		 		word.capitalize
		 	else
		 		word
		 	end
		 end
	cap_sentence.gsub(/^\w+/).each {|word| word.capitalize}
end