import Foundation

var greeting = "Hello, playground"
print(greeting)

// MARK: - 704. Binary Search
func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while right >= left {
        let mid = (left + right)/2
        
        if nums[mid] == target {
            return mid
        }else if nums[mid] < target {
            left = mid + 1
        }
        else {
            right = mid - 1
        }
    }
    
    return -1
}
print(search([0, 1, 2, 3, 4, 5, 9, 12, 23, 45, 100], 12))

// MARK: - 852. Peak Index in a Mountain Array
func peakIndexInMountainArray(_ arr: [Int]) -> Int {
    var left = 0
    var right = arr.count - 1
    
    while left <= right {
        let mid = (left + right)/2
        
        if arr[mid] > arr[mid + 1] && arr[mid] > arr[mid - 1] {
            return mid
        }
        else if arr[mid] < arr[mid + 1] {
            left = mid + 1
        }
        else {
            right = mid - 1
        }
    }
    
    return -1
}
print(peakIndexInMountainArray([18,29,38,59,98,100,99,98,90]))

// MARK: - 1342. Number of Steps to Reduce a Number to Zero
func numberOfSteps(_ num: Int) -> Int {
    var steps = 0
    var num = num
    
    while num != 0 {
        if num % 2 == 0 {
            num /= 2
        }
        else {
            num -= 1
        }
        
        steps += 1
    }
    
    return steps
}
print(numberOfSteps(14))

// MARK: - 35. Search Insert Position
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if target > nums[nums.count - 1] {
        return nums.count
    }
    if target < nums[0] {
        return 0
    }
    
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        
        var mid = (left + right) / 2
        
        if nums[mid] == target {
            return mid
        }
        else if nums[mid] < target {
            
            if nums[mid + 1] > target {
                return mid + 1
            }
            
            left = mid + 1
        }
        else {
            
            if nums[mid - 1] < target {
                return mid
            }
            
            right = mid - 1
        }
    }
    
    return -1
}
print(searchInsert([1], 1))

// MARK: - 268. Missing Number
func missingNumber(_ nums: [Int]) -> Int {
    
    if nums.count == 0 {
        return 0
    }
    
    var nums = nums
    nums.sort()
    print(nums)
    
    for i in 1..<nums.count {
        if nums[i] - nums[i - 1] > 1 {
            return nums[i] - 1
        }
    }
    if nums[0] == 0 {
        return nums[nums.count - 1] + 1
    }
    
    return 0
}
print(missingNumber([9,6,4,2,3,5,7,0,1]))
print(missingNumber([1]))


func firstBadVersion(_ n: Int) -> Int {
    var arr: [Int] = []
    
    for item in 1...n {
        arr.append(item)
    }
    
    return -1
}

print(Int.max)

// MARK: - 349. Intersection of Two Arrays
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    var set1: Set<Int> = Set(nums1.map {$0} )
    var set2 = Set(nums2.map {$0})
    
    let result: [Int] = set1.intersection(set2).map {$0}
    
    return result
}
print(intersection([1,2,2,1], [2,2]))

// MARK: - 367. Valid Perfect Square
func isPerfectSquare(_ num: Int) -> Bool {
    
    var left = 0
    var right = 2147483647
    
    while left <= right {
        let mid = (left + right) / 2
        
        if mid * mid == num {
            return true
        } else if mid * mid > num {
            right = mid - 1
        }
        else {
            left = mid + 1
        }
    }
    
    return false
}
print(isPerfectSquare(36))

// MARK: - 69. Sqrt(x)
func mySqrt(_ x: Int) -> Int {
    
    var left = 0
    var right = x
    
    while left <= right {
        let mid = (left + right) / 2
        
        if mid * mid <= x && (mid + 1) * (mid + 1) > x {
            return mid
        }
        else if mid * mid < x {
            left = mid + 1
        }
        else {
            right = mid - 1
        }
    }
    return -1
}
print(mySqrt(0))

// MARK: - 374. Guess Number Higher or Lower
//code

// MARK: - 441. Arranging Coins
func arrangeCoins(_ n: Int) -> Int {
    var coins = 0
    for i in 1...n {
        coins += i
        if coins <= n && coins + i + 1 > n {
            return i
        }
    }
    return -1
}

// MARK: - 1005. Maximize Sum Of Array After K Negations
func largestSumAfterKNegations(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums.sorted()
    var k = k
    var i = 0
    
    while i < nums.count && k > 0 && nums[i] < 0 {
        nums[i] = -nums[i]
        k -= 1
        i += 1
    }
    print(nums)
    print(i)
    
    var sum = 0
    var minValue = Int.max
    
    for num in nums {
        sum += num
        minValue = min(minValue, num)
    }
    print(minValue)
    if k % 2 == 1 {
        sum -= 2 * minValue
    }
    
    return sum
}
print(largestSumAfterKNegations([-1, 3, 2, -10, 5, 4], 3))

//MARK: - 1672. Richest Customer Wealth
func maximumWealth(_ accounts: [[Int]]) -> Int {
    var maxSum = 0
    
    for i in 0..<accounts.count {
        var sum = 0
        
        for j in 0..<accounts[i].count {
            sum += accounts[i][j]
        }
        
        maxSum = max(sum, maxSum)
    }
    
    return maxSum
}
print(maximumWealth([[1,2,3],[3,2,1]]))

// MARK: - 1047. Remove All Adjacent Duplicates In String
// Bad
func removeDuplicates(_ s: String) -> String {
    
    var s = s
    
    var index = s.startIndex
    var i = 0
    
    while index < s.endIndex {
        
        if index > s.startIndex && s[index] == s[s.index(index, offsetBy: -1)] {
            s.remove(at: index)
            s.remove(at: s.index(index, offsetBy: -1))
            
            if s.count == 0 {
                break
            }
     
            i = 0
            index = s.startIndex
        }
        i += 1
        index = s.index(after: index)
        
    }
    
    return s
}
print(removeDuplicates("abbaca"))

// Good
func removeDuplicates2(_ s: String) -> String {
    var stack = [Character]()
    
    for char in s {
        if let last = stack.last, last == char {
            stack.removeLast()
        }
        else {
            stack.append(char)
        }
    }
    
    return String(stack)
}
print(removeDuplicates2("aa"))

// MARK: - 167. Two Sum II - Input Array Is Sorted
func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1
    
    while left < right {
        let sum = numbers[left] + numbers[right]
        
        if sum == target {
            return [left + 1, right + 1]
        }
        else if sum < target {
            left += 1
        }
        else {
            right -= 1
        }
    }
    
    return []
}
print(twoSum([2,7,11,15], 9))

// MARK: - 11. Container With Most Water
func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var maxArea = 0
    
    while left < right {
        let area = (height[left] > height[right] ? height[right] : height[left]) * (right - left)
        
        maxArea = max(maxArea, area)
        
        if height[left] < height[right] {
            left += 1
        }
        else {
            right -= 1
        }
    }
    
    return maxArea
}
print(maxArea([1,8,6,2,5,4,8,3,7]))
