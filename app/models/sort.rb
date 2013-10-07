class Sort < ActiveRecord::Base

	def bubble(keys)
		bubble!(keys.clone)
	end

	def bubble!(keys)
		0.upto(keys.size-1) do |i|
			(keys.size-1).downto(i+1) do |j|
				(keys[j], keys[j-1] = keys[j-1], keys[j]) if keys[j] < keys[j-1]
			end
		end
		keys
	end

end
