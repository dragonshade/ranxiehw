def add(a,b)
	return a+b
end

def subtract(a,b)
	return a-b
end

def sum(array=[])
	if array.empty?
		return 0
	else
		sum=0
		array.each {|entry| sum+=entry}
		return sum
	end
end

def multiply(array=[])
	if array.empty?
		return 1
	else
		last = array.pop
		return last*multiply(array)
	end
end

def power(base,pow)
	if pow==1
		return base
	else
		return base*power(base,pow-1)
	end
end

def factorial(num)
	if num<=1
		return 1
	else
		return num*factorial(num-1)
	end
end