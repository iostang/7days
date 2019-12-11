#7天算法


[26. 删除排序数组中的重复项](https://leetcode.com/problems/remove-duplicates-from-sorted-array/submissions/)


```
Swift
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

Runtime: 68 ms, faster than 99.09% of Swift online submissions for Remove Duplicates from Sorted Array.

Memory Usage: 21.3 MB, less than 25.00% of Swift online submissions for Remove Duplicates from Sorted Array.

```

```
Java
class Solution {
    public int removeDuplicates(int[] nums) {
        if(nums == null || nums.length == 0) return 0;
        int p = 0,q = 1;
        while(q < nums.length){
            if(nums[p] != nums[q]){
                nums[p + 1] = nums[q];
                p++;
            }
            q++;
        }
        return p + 1;
    }
}

Runtime: 1 ms, faster than 97.84% of Java online submissions for Remove Duplicates from Sorted Array.

Memory Usage: 40.2 MB, less than 77.66% of Java online submissions for Remove Duplicates from Sorted Array.

```
**解题思路：**

    利用双指针 一快一慢
    由于数组已经是排好序的 所以只需要保证前后元素不相等即可

**遇到的问题**

Swift需要自己移除多余的元素 
removeSubrange表示删除数组内某一范围的值

Java貌似没这个问题

