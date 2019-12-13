

[21. 合并两个有序链表](https://leetcode-cn.com/problems/merge-two-sorted-lists/)

```
Swift 递归
  
  func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        
        if (l1.val < l2.val) {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
```

```
Swift 迭代
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

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

```

**解题思路(官方题解)：**

    递归：
    我们直接将以上递归过程建模，首先考虑边界情况。
    特殊的，如果 l1 或者 l2 一开始就是 null ，
    那么没有任何操作需要合并，所以我们只需要返回非空链表。
    否则，我们要判断 l1 和 l2 哪一个的头元素更小，然后递归地决定下一个添加到结果里的值。
    如果两个链表都是空的，那么过程终止，
    所以递归过程最终一定会终止。
    
    迭代：
    首先，我们设定一个哨兵节点 "prehead" ，
    这可以在最后让我们比较容易地返回合并后的链表。
    我们维护一个 prev 指针，
    我们需要做的是调整它的 next 指针。
    然后，我们重复以下过程，
    直到 l1 或者 l2 指向了 null ：
    如果 l1 当前位置的值小于等于 l2 ，
    我们就把 l1 的值接在 prev 节点的后面同时将 l1 指针往后移一个。
    否则，我们对 l2 做同样的操作。
    不管我们将哪一个元素接在了后面，
    我们都把 prev 向后移一个元素。

    在循环终止的时候， l1 和 l2 至多有一个是非空的。
    由于输入的两个链表都是有序的，
    所以不管哪个链表是非空的，
    它包含的所有元素都比前面已经合并链表中的所有元素都要大。
    这意味着我们只需要简单地将非空链表接在合并链表的后面，
    并返回合并链表。
    
    


