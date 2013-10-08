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

end
