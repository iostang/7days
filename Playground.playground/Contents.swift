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
}

let solution = Solution()

var nums = [1,1,2,2,3,3,4,5,6,7,7,8,9,9]
let count = solution.removeDuplicates(&nums)
print(count)

var rotate = [1,2,3,4,5,6,7]
let k = 3
solution.rotate(&rotate, k)
print(rotate)
