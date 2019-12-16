
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
            if let _ = map.compactMap({$0.key == complement}).first {
                return [map[complement]!,idx]
            }
            map[item] = idx
            idx+=1
        }
        return []
    }
    
    func moveZeroes(_ nums: inout [Int]) {
        //暴力
        // for i in 0..<nums.count {
        //     for j in i+1..<nums.count {
        //         if nums[i] == 0 {
        //             let temp = nums[i]
        //             nums[i] = nums[j]
        //             nums[j] = temp
        //         }
        //     }
        // }

        //1 慢指针（lastNonZeroFoundAt）之前的所有元素都是非零的
        //2 当前指针和慢速指针之间的所有元素都是零
        //当遇到一个非零元素时 交换当前指针和慢速指针指向的元素 然后前进两个指针。
        // 如果是零 只前进当前指针
        var lastNonZeroFoundAt:Int = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                let temp = nums[i]
                nums[i] = nums[lastNonZeroFoundAt]
                nums[lastNonZeroFoundAt] = temp
                lastNonZeroFoundAt+=1
            }
        }
        
//        let count = nums.count
//        nums = nums.filter { $0 != 0}
//        for _ in 0 ..< (count - nums.count) { nums.append(0) }
    }
}

let solution = Solution()

var removeDup = [1,1,2,2,3,3,4,5,6,7,7,8,9,9]
let count = solution.removeDuplicates(&removeDup)
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

let twoList = solution.mergeTwoLists(l1, l3)
print(twoList?.next?.next?.next?.val ?? -1)

var nums1:[Int] = [1,2,3,0,0,0]
let nums2:[Int] = [2,5,6]
solution.merge(&nums1,3, nums2, 3)
print(nums1)

let sum = [3,2,4]
let towNums = solution.twoSum(sum, 6)
print(towNums)

var move = [0,1,0,3,5]
solution.moveZeroes(&move)
print(move)
