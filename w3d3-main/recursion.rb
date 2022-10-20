require 'byebug'

def range(num1, num2)
    # debugger
    return [] if num2 < num1
    return [num2] if num1 == num2
    [num1] + range(num1 + 1, num2)
end

# iterative version

def iterative_sum(array)
  
    array.inject { |a , b| a+b}
    
end

def recursive_sum(array)
    return array[0] if array.length == 1
    array[0] + recursive_sum(array[1..-1]) 
end

# p iterative_sum([0,1,2,8,2,6,1,45])
# p recursive_sum([0,1,2,8,2,6,1,45])

def exponentiation(num, pow)
    # return 1 if pow == 0
    # num * exponentiation(num, pow - 1)

    return 1 if pow == 0
    return num if pow == 1
    if pow % 2 == 0
        return exponentiation(num, pow / 2) ** 2
    else
        return num * (exponentiation(num, (pow - 1) / 2) ** 2)
    end
end

# p exponentiation(5, 2)
# p exponentiation(4, 9)

class Array
   def deep_dup
       return [self[0]] if self.length == 1
       array = []
       self.each do |ele|
            if ele.is_a?(Array)
                array << ele.deep_dup
            else
                array << ele
            end
        end
       return array
   end
end

# a = [1, [2], [[4,6],89], [3, [4]]]
# b = a.deep_dup
# p a.deep_dup
# puts a.object_id
# p b
# puts b.object_id

def fibonacci(n)
    return [1] if n == 1
    return [1, 1] if n == 2
    sum = fibonacci(n - 1)[-1] + fibonacci(n - 2)[-1]
    fibonacci(n - 1) << sum
end

def iterative_fibonacci(n)
    array = []
    (n + 1).times do |num|
        if num == 1
            array << 1
        end
        if num == 2
            array << 1
        end
        if num > 2
            array << array[-1] + array[-2]
        end
    end
    array
end

# p iterative_fibonacci(5)

# def binarysearch(array, target)
#     # debugger
#     mid = array.length / 2
#     return mid if target == array[mid]
#     if array[mid] == nil
#         return nil
#     end
#     if target > array[mid]
#         idx = binarysearch(array[(mid + 1)..-1], target)
#         if idx == nil
#             return nil
#         end
#         return idx + mid + 1
#     else
#         return binarysearch(array[0...mid], target)
#     end
#     nil
# end

def binarysearch(array, target)
    array.each_with_index do |el, i|
        if target == el
            return i
        end
    end
    return nil
end

# p binarysearch([1, 2, 3], 1) # => 0
# p binarysearch([2, 3, 4, 5], 3) # => 1
# p binarysearch([2, 4, 6, 8, 10], 6) # => 2
# p binarysearch([1, 3, 4, 5, 9], 5) # => 3
# p binarysearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p binarysearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p binarysearch([1, 2, 3, 4, 5, 7], 6) # => nillear

def merge(arr1, arr2)
    new_arr = []
    i = 0
    j = 0
    while i < arr1.length && j < arr2.length
        if arr1[i] < arr2[j]
            new_arr << arr1[i]
            i += 1
        else
            new_arr << arr2[j]
            j += 1
        end
    end
    if i >= arr1.length
        while j < arr2.length
            new_arr << arr2[j]
            j += 1
        end
    end
    if j >= arr2.length
        while i < arr1.length
            new_arr << arr1[i]
            i += 1
        end
    end
    new_arr
end

def merge_sort(array)
    mid = array.length / 2
    return [array[0]] if array.length == 1
    first_half = array[0...mid]
    second_half = array[mid..-1]
    merge(merge_sort(first_half), merge_sort(second_half))
end

def subsets(array)
    return [[]] if array.length == 0
    return [[], [array[0]]] if array.length == 1
    res = [array]
    (0...array.length).each do |i|
        res += subsets([array[i]]) + subsets(array[0...i]+array[(i+1)..-1])
    end
    return res.uniq
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# p subsets([1,2,3,4])

def permutations(arr)
    return [arr[0]] if arr.length == 1
    return [[arr[0], arr[1]], [arr[1], arr[0]]] if arr.length == 2
    new_arr = []
    (0...arr.length).each do |i|
        new_arr += permutations(arr[0...i]+arr[(i+1)..-1]).map { |el| el += [arr[i]] }
    end
    new_arr
end

# p permutations([1, 2, 3, 4, 5]).length # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]


def greedy(amt, coins)
    count = 0
    temp = amt
    i = 0
    newarr = []
    while i < coins.length
        while temp >= 0
            temp -= coins[i]
            count += 1
        end
        temp += coins[i]
        count -= 1
        count.times do 
            newarr << coins[i]
        end
        count = 0
        i += 1
    end
    newarr
end



# p greedy(3921, [25,10,7,1])