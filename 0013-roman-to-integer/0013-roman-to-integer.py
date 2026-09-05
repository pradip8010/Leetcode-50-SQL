class Solution:
    def romanToInt(self, s: str) -> int:
        total = 0
        fram = {
            'I' : 1,
            'V' : 5,
            'X' : 10,
            'L' : 50,
            'C' : 100,
            'D' : 500,
            'M' : 1000
        }

        for i in range(len(s)):
            if i + 1 < len(s) and fram[s[i]] < fram[s[i+1]]:
                total -= fram[s[i]]
            else:
                total += fram[s[i]]
        return total

        