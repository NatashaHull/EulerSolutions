wdays = {0 => 'Sunday',
	1 => 'Monday',
	2 => 'Tuesday',
	3 => 'Wednesday',
	4 => 'Thursday',
	5 => 'Friday',
	6 => 'Saturday'
}
sundays = 0
1901.upto(2000) do |year|
	1.upto(12) do |month|
		day = Time.new(year, month, 1).wday
		sundays += 1 if wdays[day] == 'Sunday'
	end
end

puts sundays