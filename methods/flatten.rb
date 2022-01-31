class Array
    def my_flatten(deep_level = nil)
        @arr_result = []
        @current_deep_level = -1
        @deep_level = deep_level

        def recursive_array_iteration (el)
            if ((@deep_level == nil || @current_deep_level < @deep_level) && (el.instance_of? Array)) 
                @current_deep_level += 1

                el.each do |sub_el|
                    recursive_array_iteration(sub_el)
                end

                @current_deep_level -= 1
            else
                @arr_result << el
            end
        end

        recursive_array_iteration(self)
        @arr_result
    end
end

test_array = [1, 2, 3, 56, [8, [56, 66, 666, [1111]]], [], [[[[[[[[[[[[[[[[[[[[8]]]]]]]]]]]]]]]]]]]]]

p test_array.my_flatten(16)
p test_array.flatten(16)
