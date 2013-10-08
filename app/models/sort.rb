class Sort < ActiveRecord::Base

	attr_accessible :bubble, :quick, :merge

	def self.bubble(list)
		list.each_index do |i|
			(list.length - i - 1).times do |job|
				if list[job] > list[job + 1]
					list[job], list[job + 1] = list[job + 1], list[job]
				end
			end
		end
	end

	def self.quick_sort(list)
		sl = list.clone
		return sl if sl.size <= 1
		pivot = sl.pop
		left, right = sl.partition { |e| e < pivot }
		quick_sort(left) + [pivot] + quick_sort(right)
	end

	def self.merge_sort(list)
		return list if list.size < 2
		left = list[0, list.length/2]
		right = list[list.length/2, list.length]

		merge(merge_sort(left), merge_sort(right))
	end

	def self.merge(left, right)
		sorted_list = []
		until left.empty? || right.empty?
			sorted_list << (left[0] <= right[0] ? left.shift : right.shift)
		end
		sorted_list.concat(left).concat(right)
		p sorted_list
	end

end
