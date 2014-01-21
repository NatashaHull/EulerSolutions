#Combinatorics solution
def paths lattice_length
	c(2 * lattice_length, lattice_length)
end

def n!(n)
	x = 1
	while n > 1
		x *= n
		n -= 1
	end
	x
end

def c(m,n)
	n!(m) / (n!(m-n) * n!(n))
end

puts paths(20)