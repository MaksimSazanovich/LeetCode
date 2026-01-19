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
print(isPerfectSquare(0))
