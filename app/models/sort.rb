class Sort < ActiveRecord::Base

	#Bubble sort
	def self.bubble(list)
		list.each_index do |i|
			(list.length - i - 1).times do |k|
				if list[k] > list[k + 1]
					#ruby parallel assignment (swap)
					list[k], list[k + 1] = list[k + 1], list[k]
				end
			end
		end
	end

	#Quick sort
	def self.quick_sort(list)
		sl = list.clone
		return sl if sl.size <= 1
		pivot = sl.pop
		left, right = sl.partition { |e| e < pivot }
		quick_sort(left) + [pivot] + quick_sort(right)
	end

	#Merge sort
	def self.merge_sort(list)
		return list if list.size < 2
		left = list[0, list.length/2]
		right = list[list.length/2, list.length]

		merge(merge_sort(left), merge_sort(right))
	end

	#Merge-operation
	def self.merge(left, right)
		sorted_list = []
		until left.empty? || right.empty?
			#if left <= right index, add left, else right
			sorted_list << (left[0] <= right[0] ? left.shift : right.shift)
		end
		#combine lists together
		sorted_list.concat(left).concat(right)
	end

end
