# ***					  ***
# *** HERE LIES FUNCTIONS ***
# *** 					  ***

# Creates a hash of a all possible company pairs, generates all possible PAIRS.
def combinations_of(input)
  pair_combinations, i = {},0
    input.each do |row|
      i += 1
      row_number = "row_" + i.to_s
      combo_row = row.combination(2).to_a
      pair_combinations[row_number] = combo_row
    end
  return pair_combinations
end

# Checks number of co-occurrences for each pair against USER specified N.
def check_n_against(input, n)
  greater_equal_n = input.delete_if {|key, value| value < n}
  sorted_pairs = greater_equal_n.sort.flatten(1)
  trimmed_pairs = sorted_pairs.delete_if{|i| i.is_a? Integer}
  return trimmed_pairs
end	

# ***					 ***
# *** ACTION STARTS HERE ***
# *** 					 ***

# Opens file from terminal, parses and pushes to occurrences array.
occurrences, n 	= [],0
File.open(ARGV.first, "r") do |f|
  f.each_line do |line|
    sentence = line.chomp.split(",") 
   	  # Searches for number N at the beginning of input and sets it to n.
	  if line.match(/\d/)    
  	    n = line.to_i
	  end
	occurrences.push(sentence)
  end
end

pair_array = combinations_of(occurrences) 

# Finds NUMBER OF CO-OCCURRENCES for every possible pair of occurrences.
  cooccurrences 	= {}
  row_counter 		= 0

  # Row of pairs [[Company, Company],[Company, Company]]
  for row in pair_array	
	row_counter += 1

	# Single Pair [Company, Company]
	for pair in pair_array["row_#{row_counter}"]  	
	  times 		  = 0
	  inner_counter  = 0

	  for row in pair_array
		inner_counter += 1
		# Ticker for each time pair comes up
		if pair_array["row_#{inner_counter}"].include? pair 
			times += 1
		end
	  end
	    # Pushes pair and times co-occurring to cooccurrences array.
	  cooccurrences.store(pair, times) 
	end
  end
### 

output = check_n_against(cooccurrences, n)

# Outputs to file of choice, text is joined by comma
File.open(ARGV[1], "w+") do |f|
  for i in output
	f.puts i.join(",")
  end
end

# ***					***
# ***  	END OF ACTION   ***
# ***					***