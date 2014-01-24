def reverser
	yield.gsub(/\w+/) do |word|
		word.reverse
	end
end

def adder(num=nil)
	if num.nil?
		yield + 1
	else
		yield + num
	end
end

def repeater(num=nil)
	if num.nil?
		yield
	else
		1.upto(num) do
			yield
		end
	end 
end