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

end
