

[20. 有效的括号](https://leetcode-cn.com/problems/valid-parentheses/submissions/)

```
Swift 
func isValid(_ s: String) -> Bool {
        var stack = ""
        let buckets: [Character: Character] = ["}": "{", "]": "[", ")": "("]
        for char in s {
            guard let expectedPrevBracket = buckets[char] else { 
                stack.append(char); 
                continue 
            }
            
            if let last = stack.last, expectedPrevBracket == last {
                stack.removeLast()
            } else {
                return false
            }
        }

        return stack.isEmpty
    }
```

