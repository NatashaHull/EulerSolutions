ALPHABET = {}
i = 1
('a'.ord).upto('z'.ord) do |letter|
	ALPHABET[letter.chr] = i
	i += 1
end

def file_score file
	names = File.readlines(file).join('').gsub('"', "").split(",").sort
	total_score = 0
	names.each_with_index do |name, i|
		total_score += name_score(name) * (i + 1)
	end
	total_score
end

def name_score name
	letters = name.downcase.split('')
	sum = 0
	letters.each { |letter| sum += ALPHABET[letter] }
	sum
end

puts file_score('names.txt')