class RPNCalculator

	def initialize
		@cmdQ=[]
	end

	def push(btn)
		@cmdQ.push(btn)
	end

	def plus
		if @cmdQ.empty?
			raise "calculator is empty"
		else
			@cmdQ.push("+")
		end
	end

	def minus
		if @cmdQ.empty?
			raise "calculator is empty"
		else
			@cmdQ.push("-")
		end
	end

	def times
		if @cmdQ.empty?
			raise "calculator is empty"
		else
			@cmdQ.push("*")
		end
	end

	def divide
		if @cmdQ.empty?
			raise "calculator is empty"
		else
			@cmdQ.push("/")
		end
	end

	def value
		while ["+","-","*","/"].include?(@cmdQ.last)
			stack=[]
			@cmdQ=eval(stack)
		end
		if @cmdQ.length==1
			return @cmdQ.pop
		else 
			return @cmdQ.last
		end
	end

	#my solution actually uses Queue instead of stack
	#So I have to reverse the stack on return
	def eval(stack)
		if @cmdQ.empty?
			return stack.reverse
		else
			state=@cmdQ.pop
			if ["+","-","*","/"].include?(state)
				pop1=@cmdQ.pop
				#pop1 is num
				if not ["+","-","*","/"].include?(pop1)
					if not ["+","-","*","/"].include?(@cmdQ.last)
						#pop1 pop2 are nums, evaluate and push
						stack.push(calc(pop1,@cmdQ.pop,state))
						eval(stack)
					else
						#pop1 num, pop2 op
						stack.push(state)
						stack.push(pop1)
						eval(stack)
					end
				else 
				#pop1 is op
					stack.push(state)
					@cmdQ.push(pop1) #push pop1 back
					eval(stack)
				end
			else #if the state is not op, wait for further input
				stack.push(state)
				return stack.reverse
			end
		end
	end

	def calc(b,a,op)
		case op
		when "+"
			return a+b
		when "-"
			return a-b
		when "*"
			return a*b
		when "/"
			return a/b.to_f
		else
			return nil #Error
		end
	end

	def tokens(string)
		array=[]
		string.split.each do |char|
			case char
			when "+" 
				array.push(:+)
			when "-" 
				array.push(:-)
			when "*" 
				array.push(:*)
			when "/" 
				array.push(:/)
			else
				array.push(char.to_i)
			end
		end
		return array
	end

	def evaluate(str)
		@cmdQ=[]
		 str.split.each do |char|
			if ("0".."9").include?(char)
				@cmdQ.push(char.to_i)
			else
				@cmdQ.push(char)
			end
		end
		return self.value
	end
end
