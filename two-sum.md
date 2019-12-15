

[1. 两数之和](https://leetcode-cn.com/problems/two-sum/)

```
Swift 一遍哈希表

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
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

```

```
//暴力解法
   for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[j] == target - nums[i] {
                    return [i,j]
                }
            }
        }
```
**解题思路：**
    
    暴力：
    暴力法很简单，遍历每个元素 x，
    并查找是否存在一个值与 target−x 相等的目标元素。
    
    一遍哈希表：
    在进行迭代并将元素插入到表中的同时
    还要检查表中是否已经存在当前元素所对应的目标元素。
    如果它存在立即将其返回
    


