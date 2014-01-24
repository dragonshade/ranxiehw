def measure(num=1)
	start=Time.now.to_i
	1.upto(num) do
	yield
	end
   return ((Time.now.to_i - start).to_f/num )
end