class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        s = s.strip()
        new_s = s.split(" ")
        last_s = new_s[-1]
        return len(last_s)