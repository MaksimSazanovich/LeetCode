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

// MARK: - 125. Valid Palindrome
func isPalindrome(_ s: String) -> Bool {
    
    let delimeters: CharacterSet = .punctuationCharacters.union(.whitespacesAndNewlines).union(CharacterSet(charactersIn: "`"))
    
    let newString = s.filter { char in
        guard let scalar = char.unicodeScalars.first else { return false }
        return !delimeters.contains(scalar)
    }.lowercased()
    
    print(newString)
    
    let chars: [Character] = Array(newString)
    
    var left = 0
    var right = newString.count - 1
    
    while left < right {
        if chars[left] != chars[right] {
            return false
        } else {
            left += 1
            right -= 1
        }
    }
    return true
}
print(isPalindrome("`l;`` 1o1 ??;l`"))

// MARK: - 26. Remove Duplicates from Sorted Array
// Bad
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var result = 1
    var resultNums = [nums[0]]
    var dublicateFound = false
    
    for (index, num) in nums.enumerated() {
        if index > 0 {
            
            if num == nums[index - 1] {
                if !dublicateFound {
                    dublicateFound = true
                } else {
                    continue
                }
            } else if dublicateFound {
                dublicateFound = false
            }
            
            if !dublicateFound {
                resultNums.append(num)
                result += 1
            }
        }
    }
    nums = resultNums
    return result
}
var nums = [1, 1, 2]
print(removeDuplicates(&nums))
print(nums)

// Good
func removeDuplicates2(_ nums: inout [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    
    var writeIndex = 1
    
    for readIndex in 1..<nums.count {
        if nums[readIndex] != nums[readIndex - 1] {
            nums[writeIndex] = nums[readIndex]
            writeIndex += 1
        }
    }
    
    return writeIndex
}
var nums2 = [1, 1, 2]
print(removeDuplicates2(&nums2))
print(nums2)

// MARK: - 80. Remove Duplicates from Sorted Array II
func removeDuplicates3(_ nums: inout [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    
    var writeIndex = 1
    var acc = 1
    var k = 0
    var isStart = true
    
    for readIndex in 1..<nums.count {
        if nums[readIndex] == nums[readIndex - 1] {
            acc += 1
        }
        else if acc >= 3 {
            print("dsssd")
            if isStart {
                while acc > 2 {
                    nums[readIndex - acc + 2] = nums[readIndex]
                    acc -= 1
                }
                isStart = false
            } else {
                while acc > 2 {
                    nums[readIndex - acc] = nums[readIndex]
                    acc -= 1
                }
            }
            
            k += 1
            acc = 1
        }
        //print(nums)
    }
    return k
}
var nums3 = [1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 4] // [1, 1, 2, 2, 3, _, _, _]
print(removeDuplicates3(&nums3))
print(nums3)
// НЕ РЕШЕНО!!!

// MARK: - 977. Squares of a Sorted Array
func sortedSquares(_ nums: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: nums.count)
    
    var left = 0
    var right = nums.count - 1
    var index = nums.count - 1
    
    while left <= right {
        
        let leftSquare = nums[left] * nums[left]
        let rightSquare = nums[right] * nums[right]
        
        if leftSquare < rightSquare {
            result[index] = rightSquare
            right -= 1
        }
        else {
            result[index] = leftSquare
            left += 1
        }
        index -= 1
    }
    
    return result
}
print(sortedSquares([-4, -3, -1,0,3,10]))  // [0,1,9,16,100]

// MARK: - 1876. Substrings of Size Three with Distinct Characters
func countGoodSubstrings(_ s: String) -> Int {
    var count = 0
    
    guard s.count > 2 else { return 0 }
    
    var left = 0
    var right = 2
    
    let string: [Character] = Array(s)
    var dictionary = [Character: Int]()
    
    
    for i in 0..<string.count {
        dictionary[string[i], default: 0] += 1
        
        if i == right {
            if dictionary.count == 3 {
                count += 1
            }
            
            dictionary[string[left]]! -= 1
            
            if dictionary[string[left]]! == 0 {
                dictionary.removeValue(forKey: string[left])
            }
            
            left += 1
            right += 1
        }
    }
    
    return count
}
print(countGoodSubstrings("xyzzaz")) // xyz yzz zza zaz
/*
 l
 a a b a b c a b c
 r
 
 */

//MARK: - 674. Longest Continuous Increasing Subsequence
func findLengthOfLCIS(_ nums: [Int]) -> Int {
    var maxLength = 1
    var currentLenght = 1
    
    for i in 0..<nums.count - 1 {
        if nums[i] < nums[i + 1] {
            currentLenght += 1
        } else {
            currentLenght = 1
        }
        maxLength = max(maxLength, currentLenght)
    }
    
    return maxLength
}
print(findLengthOfLCIS([1, 2, 3, 10, 1, 3]))


// MARK: - 978. Longest Turbulent Subarray
// Bad
class Solution {
    func maxTurbulenceSize(_ arr: [Int]) -> Int {
        guard arr.count > 1 else { return arr.count }
        
        var maxSize = 2
        var currentSize = 2
        var turbulence = TurbulenceType.none
        
        if arr[0] == arr[1] {
            currentSize = 1
            maxSize = 1
        }
        
        if arr[0] > arr[1] {
            turbulence = TurbulenceType.up
        } else {
            turbulence = TurbulenceType.down
        }
        
        for i in 1..<arr.count - 1 {
            if turbulence == TurbulenceType.up {
                if arr[i] < arr[i + 1] {
                    currentSize += 1
                    turbulence = TurbulenceType.down
                } else if  arr[i] > arr[i + 1] {
                    currentSize = 2
                    turbulence = TurbulenceType.up
                } else {
                    currentSize = 1
                    turbulence = TurbulenceType.up
                }
            } else if turbulence == TurbulenceType.down {
                if arr[i] > arr[i + 1] {
                    currentSize += 1
                    turbulence = TurbulenceType.up
                } else if arr[i] < arr[i + 1] {
                    currentSize = 2
                    turbulence = TurbulenceType.down
                } else {
                    currentSize = 1
                    turbulence = TurbulenceType.down
                }
            }
            maxSize = max(maxSize, currentSize)
        }
        
        return maxSize
    }
}

/*
 [1, 3, 2, 1]      1 < 3 > 2 > 1
 [0,1,1,0,1,0,1,1,0,0]     0 < 1 = 1 > 0 < 1 > 0 < 1 = 1 > 0 = 0
 */

enum TurbulenceType {
    case up
    case down
    case none
}

// Good
func maxTurbulenceSize2(_ arr: [Int]) -> Int {
    guard arr.count > 1 else { return arr.count }
    
    var maxSize = 1
    var currentSize = 2
    
    for i in 1..<arr.count - 1 {
        if (arr[i - 1] < arr[i] && arr[i] > arr[i + 1]) || (arr[i - 1] > arr[i] && arr[i] < arr[i + 1]) {
            currentSize += 1
        } else if arr[i] == arr[i + 1] {
            currentSize = 1
        } else {
            currentSize = 2
        }
        maxSize = max(maxSize, currentSize)
    }
    
    return maxSize
}
print(maxTurbulenceSize2([1,3,2,1])) // 1 < 3 > 2 > 1

// MARK: - 121. Best Time to Buy and Sell Stock
func maxProfit(_ prices: [Int]) -> Int {
    var minPrice = Int.max
    var maxProfit = 0
    
    for price in prices {
        minPrice = min(minPrice, price)
        maxProfit = max(maxProfit, price - minPrice)
    }
    
    return maxProfit
}
print(maxProfit([7,1,5,3,6,4]))

// MARK: 217. Contains Duplicate
func containsDuplicate(_ nums: [Int]) -> Bool {
    var dict = [Int: Int]()
    
    
    for num in nums {
        dict[num, default: 0] += 1
        
        if dict[num]! >= 2 {
            return true
        }
    }
    
    for (key, value) in dict {
        if value >= 2 {
            return true
        }
    }
    
    return false
}

// MARK: 448. Find All Numbers Disappeared in an Array
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    
    var set = Set<Int>()
    var result = [Int]()
    
    for num in nums {
        set.insert(num)
    }
    
    for num in 1...nums.count {
        if !set.contains(num) {
            result.append(num)
        }
    }
    
    return result
}

//MARK: 136. Single Number
func singleNumber(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    
    for num in nums {
        if set.contains(num) {
            set.remove(num)
        } else {
            set.insert(num)
        }
    }
    
    return set.first ?? -1
}

// MARK: 5. Longest Palindromic Substring
func longestPalindrome(_ s: String) -> String {
    
    let str = Array(s)
    var ans = [Character]()
    
    
    for i in 0...str.count {
        var left = i
        var right = i
        
        while left <= right && left >= 0 && right < str.count {
            if left < 0 || right > str.count - 1 {
                break
            }
            if str[left] != str[right] {
                break
            }
            
            if right - left + 1 > ans.count {
                ans = Array(str[left...right])
            }
            left -= 1
            right += 1
        }
        
        left = i
        right = i + 1
        
        while left <= right && left >= 0 && right < str.count {
            if left < 0 || right > str.count - 1 {
                break
            }
            if str[left] != str[right] {
                break
            }
            
            if right - left + 1 > ans.count {
                ans = Array(str[left...right])
            }
            left -= 1
            right += 1
        }
    }
    
    return String(ans)
}

/*
 |
 b a b a d
 |
 |
 
 
 |
 c b b d
 |
 |
 
 
 |
 b a a b d
 |
 
 
 */

// MARK: 876. Middle of the Linked List
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func middleNode(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
}


            return slow
}
