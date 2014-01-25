class Dictionary
	def initialize
		@entries={}
	end

	def add(arg)
		if arg.is_a?(Hash)
			arg.each do |key,word|
				@entries[key]=word
			end
		elsif arg.is_a?(String)
			@entries[arg]=nil
		end
	end

	def keywords
		return @entries.keys.sort
	end

	def entries
		@entries
	end

	def include?(str)
		return @entries.keys.include?(str)
	end

	def find(str)
		match=findprefix(str)
		hash_found={}
		match.each do |key|
			hash_found[key]=@entries[key]
		end
		return hash_found
	end

	def printable
		printout=""
		keys=self.keywords  #alphabetical order
		#ugly way of handling last element : (
		0.upto(keys.length-2) do |i|
			printout+="[#{keys[i]}]"+ " "+"\"#{@entries[keys[i]]}\""+"\n"
		end
			printout+="[#{keys.last}]"+" "+"\"#{@entries[keys.last]}\""
		return printout
	end

	private 
	def findprefix(prefix)
		match=[]
		@entries.keys.each do |key|
			#take the union of the match keys
			match+=(key.scan(/^#{prefix}\w*/))
		end
		return match
	end
end