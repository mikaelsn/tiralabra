require 'test_helper'

class SortTestAscending < ActiveSupport::TestCase

	def setup
		@ordered = (0..6000).to_a
		@list = Sort.populate('asc', 6000)
	end

	test "Ruby built-in sort" do
		time = Benchmark.realtime do
			@list = @list.sort
		end
		p "Ruby built-in sort took #{time*1000}ms"
		assert_equal(@ordered, @list)
	end
	
	test "Bubblesort normal case" do
		time = Benchmark.realtime do 
			@list = Sort.bubble(@list)
		end
		p "Bubble took #{time*1000}ms"
		assert_equal(@ordered, @list)
	end

	test "Quicksort normal case" do
		time = Benchmark.realtime do
			@list = Sort.quick_sort(@list)
		end
		p "Quick took #{time*1000}ms"
		assert_equal(@ordered, @list)
	end

	test "Mergesort normal case" do
		time = Benchmark.realtime do
			@list = Sort.merge_sort(@list)
		end
		p "Merge took #{time*1000}ms"
		assert_equal(@ordered, @list)
	end

	test "Insertion sort normal case" do
		time = Benchmark.realtime do
			@list = Sort.insert_sort(@list)
		end
		p "Insert took #{time*1000}ms"
		assert_equal(@ordered, @list)
	end



end
