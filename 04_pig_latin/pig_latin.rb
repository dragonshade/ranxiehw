def translate(sentence)
	translated_sentence=
	sentence.gsub(/\w+/).each do |word|
		translatewords(word)
	end
	return translated_sentence
end

def translatewords(word)
	if %w{a e i o u}.include?(word[0])  #vowel
		return word+"ay"
	else 								#one consonant
		if word[0..1]=="qu"  #special case qu
			return word[2..word.length-1]+"quay"
		elsif %w{a e i o u}.include?(word[1])
			return word[1..word.length-1]+word[0]+"ay"
		else							#two consonant
			if word[1..2]=="qu"
				return word[3..word.length-1]+word[0..2]+"ay"
			elsif %w{a e i o u}.include?(word[2])
				return word[2..word.length-1]+word[0..1]+"ay"
			else
				return word[3..word.length-1]+word[0..2]+"ay"
			end
		end
	end
end