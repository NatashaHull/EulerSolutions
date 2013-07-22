terms = []
2.upto(100) do |a|
	2.upto(100) do |b|
		term = a ** b
		terms << term unless terms.include?(term)
	end
end

puts terms.length