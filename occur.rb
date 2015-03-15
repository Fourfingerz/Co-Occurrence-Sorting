# Accepts a file from STDIN in terminal, pushes to "row" array
row 	= []
n 		= 0

File.open(ARGV.first, "r") do |f|
	f.each_line do |line|

	  # REFACTOR
	  sentence = line.chomp.split(",") 

	  # REFACTOR		
	  if line.match(/\d/)
	  	n = line.to_i
	  end
	  row.push(sentence)
	end
end

#REFACTOR
# Creates a hash of a all possible company pairs sorted by row
pair_combinations = {}
num 			  = 0
row.each do |row|
		num += 1
		row_number = "row_" + num.to_s
		combo_row = row.combination(2).to_a
		pair_combinations[row_number] = combo_row
end



#REFACTOR
# Non-destructive object duplication
pair_array 		= pair_combinations.dup 
pair_array2 	= pair_array.dup



# REFACTOR
cooccurrences 	= {}
row_counter 	= 0
# Row of pairs [[Company, Company],[Company, Company]]
for row in pair_array	
	row_counter += 1

	# Single Pair [Company, Company]
	for pair in pair_array["row_#{row_counter}"] 	
		times 		= 0
		row_count2  = 0

		for row in pair_array2
			row_count2 += 1
			
			if pair_array["row_#{row_count2}"].include? pair
				times += 1
			end
		end
		cooccurrences.store(pair, times)
	end
end 



# REFACTOR
greater_equal_n = cooccurrences.delete_if {|key, value| value < n}
sorted_companies = greater_equal_n.sort.flatten(1)
trimmed_companies = sorted_companies.delete_if{|i| i.is_a? Integer}

File.open("output.txt", "w+") do |f|
	for i in trimmed_companies
		f.puts i.join(",")
	end
end
