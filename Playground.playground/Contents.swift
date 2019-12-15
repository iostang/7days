
class ListNode {
    let val:Int
    var next: ListNode?
    init(_ val:Int) {
        self.val = val
    }
}

class Solution {
    
    /// 删除有序数组重复元素
    /// - Parameter nums: [Int]
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let numsCount = nums.count
        if numsCount == 0 || numsCount == 1 {
            return numsCount
        }
        var p = 0
        var q = 1
        while q < numsCount {
            if nums[p] != nums[q] {
                nums[p + 1] = nums[q]
                p+=1
            }
            q+=1
        }
        let resultCount = p + 1
        if (resultCount < numsCount) {
            let range = resultCount...numsCount-1
            nums.removeSubrange(range)
        }
        return resultCount
    }
    
    /// 旋转数组
    /// - Parameter nums: [Int]
    /// - Parameter k: k
    func rotate(_ nums: inout [Int], _ k: Int) {
        if (nums.count <= 1) {
            return
        }
        let rotateCount = k % nums.count; //这一步很重要
        
        reverse(&nums, start: 0, end: nums.count - 1)
        reverse(&nums, start: 0, end: rotateCount - 1)
        reverse(&nums, start: rotateCount, end: nums.count - 1)
    }
    
    private func reverse(_ nums: inout [Int], start: Int, end: Int) {
        var start = start, end = end
        while start < end {
            let temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1
        }
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        guard let l1 = l1 else { return l2 }
//        guard let l2 = l2 else { return l1 }
//
//        if (l1.val < l2.val) {
//            l1.next = mergeTwoLists(l1.next, l2)
//            return l1
//        } else {
//            l2.next = mergeTwoLists(l1, l2.next)
//            return l2
//        }
        
        let prevHead:ListNode? = ListNode(-1)
        var prev = prevHead
        var l1 = l1
        var l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                prev?.next = l1
                l1 = l1!.next
            } else {
                prev?.next = l2
                l2 = l2!.next
            }
            prev = prev?.next
        }
        
        prev?.next = l1 == nil ? l2 : l1
        return prevHead?.next
    }

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        var p1 = m - 1;
        var p2 = n - 1;
        var p = m + n - 1;
        
        while p1 >= 0 && p2 >= 0 {
            let nums1IsLess = nums1[p1] < nums2[p2]
            nums1[p] = nums1IsLess ? nums2[p2] : nums1[p1]
            nums1IsLess ? (p2 -= 1) : (p1 -= 1)
            p -= 1
        }
        nums1[0..<p2+1] = nums2[0..<p2+1]
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
//        for i in 0..<nums.count {
//            for j in i+1..<nums.count {
//                if nums[j] == target - nums[i] {
//                    return [i,j]
//                }
//            }
//        }


        var map:[Int:Int] = [:]
        var idx:Int = 0
        for item in nums {
            let complement = target - item
            if map.keys.contains(complement) {
                return [map[complement]!,idx]
            }
            map[item] = idx
            idx+=1
        }
        return []
    }
}

let solution = Solution()

var nums = [1,1,2,2,3,3,4,5,6,7,7,8,9,9]
let count = solution.removeDuplicates(&nums)
print(count)

var rotate = [1,2,3,4,5,6,7]
let k = 3
solution.rotate(&rotate, k)
print(rotate)

var l1 = ListNode(1)
var l2 = ListNode(3)
var l3 = ListNode(2)
var l4 = ListNode(4)
l1.next = l2
l3.next = l4

let l = solution.mergeTwoLists(l1, l3)
print(l?.next?.next?.next?.val ?? -1)

var nums1:[Int] = [1,2,3,0,0,0]
let nums2:[Int] = [2,5,6]
solution.merge(&nums1,3, nums2, 3)
print(nums1)

let sum = [2,7,11,15]
let towNums = solution.twoSum(sum, 9)
print(towNums)
