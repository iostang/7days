[88. 合并两个有序数组](https://leetcode-cn.com/problems/merge-sorted-array/)

```
Swift 双指针 / 从后往前

 func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1;
        var p2 = n - 1;
        var p = m + n - 1;
        
        while p1 >= 0 && p2 >= 0 {
            if nums1[p1] < nums2[p2] {
                nums1[p] = nums2[p2]
                p2 -= 1
            } else {
                nums1[p] =  nums1[p1]
                p1 -= 1
            }
            p -= 1
            
        }
        nums1[0..<p2+1] = nums2[0..<p2+1]
   }
```

       
    




