class Solution {
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
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
}


//var nums = [1,1,2,2,3,3,4,5,6,7,7,8,9,9]
var nums = [1,2,3]
let count = Solution.removeDuplicates(&nums)
print(count)
