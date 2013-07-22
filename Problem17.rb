NUMS = { 1 => "one",
	2 => "two",
	3 => "three",
	4 => "four",
	5 => "five",
	6 => "six",
	7 => "seven",
	8 => "eight",
	9 => "nine",
	10 => "ten",
	11 => "eleven",
	12 => "twelve",
	13 => "thirteen",
	14 => "fourteen",
	15 => "fifteen",
	16 => "sixteen",
	17 => "seventeen",
	18 => "eighteen",
	19 => "nineteen",
	20 => "twenty",
	30 => "thirty",
	40 => "forty",
	50 => "fifty",
	60 => "sixty",
	70 => "seventy",
	80 => "eighty",
	90 => "ninety"
}

p NUMS

def number_parser num
	num_str = ""
	if num.to_s.length == 3
		num_str += hundred_parser(num)
	elsif num == 1000
		num_str = "one thousand"
	elsif num > 19
		num_str += tens_parser(num)
	else		
		num = NUMS[num]
	end
end

def hundred_parser num
	new_num = num / 100
	num_str = "#{NUMS[new_num]} hundred"
	if num % 100 != 0
		num_str += " and "
		remainder = num - (new_num * 100)
		if remainder > 19
			num_str += tens_parser(remainder)
		else
			num_str += NUMS[remainder]
		end
	end
	num_str
end

def tens_parser num
	new_num = (num / 10) * 10
	num_str = "#{NUMS[new_num]}"
	if num % 10 != 0
		remainder = num - (new_num)
		num_str += "-#{NUMS[remainder]}"
	end
	num_str
end

letters_to_thousand = ""
1.upto(1000) { |x| letters_to_thousand += "#{number_parser(x)} " }
words = letters_to_thousand.split(/\s|\-/)
puts words.join.length