class Array
	def sum(index=0)
		if index==length
			return 0
		else
			return self[index]+sum(index+1) 
		end
	end

	def square
		if self.empty?
			return self
		else
			newarray=[]
			self.each {|x| newarray.push(x*x)}
			return newarray
		end
	end

	def square!
				if self.empty?
			return self
		else
			0.upto(length-1) do |i|
			 self[i]=self[i]*self[i]
			end
			return self
		end
	end
end