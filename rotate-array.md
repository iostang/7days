

[189. 旋转数组](https://leetcode-cn.com/problems/rotate-array/)

```
Swift
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
```
**解题思路：**

    原始数组 : 1 2 3 4 5 6 7

使用三次反转 过程如下

    第一次反转后 : 7 6 5 4 3 2 1

    第二次反转后 : 5 6 7 4 3 2 1

    第三次反转后 : 5 6 7 1 2 3 4 --> 结果

**注意点：**
    
    rotateCount = k % nums.count 
    这是为了解决k大于数组的情况

