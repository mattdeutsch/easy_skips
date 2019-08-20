require 'distribution'

AVERAGE_WR = 18.56147273
STDDEV_WR = 20.34245748
TIME_TO_SKIP = 12

def time_to_one_level(skipping_time)
	# Generate random levels according to a normal distribution of WR times
	normal = Distribution::Normal.rng(AVERAGE_WR, STDDEV_WR)
	# level_wrs = []
	# 100.times do |i|
	# 	level_wrs << normal.call
	# end
	time = 0
	loop do
		t = normal.call
		if t < skipping_time
			# Play the level
			time += t
			return time
		else
			# Skip
			time += TIME_TO_SKIP
		end
	end
end

## TRIALS

skip_time = 5

while skip_time < 60
	total = 0
	10000.times do |i|
		total += time_to_one_level(skip_time)
	end
	puts "SKIP TIME: #{skip_time}. TIME TAKEN: #{total}"
	skip_time += 1
end