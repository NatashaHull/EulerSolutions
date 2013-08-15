#Initial brute force attempt in ruby
def reciprocal_cycles num
	vals = ((1.to_f / num.to_f) * (10 ** 30)).to_s
	p vals
	cycle = 0
	j = 0
	i = 0
	until cycle != 0 && vals.slice(i..j-1) == vals.slice(j..((j-1) + cycle))
		j += 1
		if vals[j] == nil || (vals[j] == 0 && vals[j+1] == 0)
			cycle = nil
			break
		end
		i = vals.index(vals[j])
		cycle = j - i
	end
	cycle
end

d = 2
longest_reciprocal_cycle = 0
while d < 1000
	cycle = reciprocal_cycles(d)
	d += 1
	next if cycle == nil
	if cycle > longest_reciprocal_cycle
		longest_reciprocal_cycle = cycle
		result = d - 1
	end
	puts d
end
puts longest_reciprocal_cycle
puts result