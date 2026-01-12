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
