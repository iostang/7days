[283.移动零](https://leetcode-cn.com/problems/move-zeroes/)

```
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
 
 
 // for i in 0..<nums.count {
 //     for j in i+1..<nums.count {
 //         if nums[i] == 0 {
 //             let temp = nums[i]
 //             nums[i] = nums[j]
 //             nums[j] = temp
 //         }
 //     }
 // }
```

```
Swift 系统函数解法 （国际站找到的）

 let count = nums.count
 nums = nums.filter { $0 != 0}
 for _ in 0 ..< (count - nums.count) { nums.append(0) }

Runtime: 36 ms, faster than 98.59% of Swift online submissions for Move Zeroes.
Memory Usage: 21.3 MB, less than 6.25% of Swift online submissions for Move Zeroes.

```

       
    




