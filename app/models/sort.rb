class Sort < ActiveRecord::Base

	#Bubblesort
	def self.bubble(list)
		list.each_index do |i|
			(list.length - i - 1).times do |k|
				if list[k] > list[k + 1]
					#Ruby parallel assignment (swap)
					list[k], list[k + 1] = list[k + 1], list[k]
				end
			end
		end
	end

	#Quicksort
	def self.quick_sort(list)
		#Initialize a clone list for operations
		sl = list.clone
		#Already in order
		return sl if sl.size <= 1
		pivot = sl.pop
		#Using Ruby built-in partition
		left, right = sl.partition { |e| e < pivot }
		#Recursive calls for the both sides using pivot
		quick_sort(left) + [pivot] + quick_sort(right)
	end

	#Mergesort
	def self.merge_sort(list)
		#Already in order
		return list if list.size < 2
		#Divide and conquer, split the list and halves
		left = list[0, list.length/2]
		right = list[list.length/2, list.length]

		merge(merge_sort(left), merge_sort(right))
	end

	#Merge-operation
	def self.merge(left, right)
		sorted_list = []
		until left.empty? || right.empty?
			#If left <= right index, add left, else right to the sorted list
			sorted_list << (left[0] <= right[0] ? left.shift : right.shift)
		end
		#Return concatenated list
		sorted_list.concat(left).concat(right)
	end

	#Insertion sort
	def self.insert_sort(list)
		for i in 1..(list.length - 1)
			x = list[i]
			j = i - 1
			while j >= 0 and list[j] > x
				list[j + 1] = list[j] 
				j -= 1
			end
			list[j + 1] = x
		end
		list
	end

  #Fill the list in random, ascdening or descending order
  def self.populate(cond, inp)
  	if cond == 'random'
  		(0..inp.to_i).to_a.sort{ rand() - 0.5 }[0..inp.to_i]
  	elsif cond == 'desc'
  		Array.new(inp.to_i) { |i| (inp.to_i)-i }
  	elsif cond == 'asc'
  		(0..inp.to_i).to_a
  	end
  end


end
