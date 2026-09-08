import math

word = 'james edward'
word_parse = list(word)
word_parse_num = [ord(char)-96 for char in word_parse]
print(word_parse_num)

def circular_shift(arr, k, direction="right"):
    if not arr:
        return arr
    
    # Handle shifts larger than the list length
    k = k % len(arr) 
    
    if direction == "right":
        # Split at the end and move to the front
        return arr[-k:] + arr[:-k]
    elif direction == "left":
        # Split at the front and move to the end
        return arr[k:] + arr[:k]

# Example Usage:
my_list = [1, 2, 3, 4, 5]
alpha = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']

print(circular_shift(alpha, 2, "right"))  # Output: [4, 5, 1, 2, 3]
print(circular_shift(alpha, 2, "left"))   # Output: [3, 4, 5, 1, 2]

alt_alpha = circular_shift(alpha, 2, "right")
print(alpha[25])
print(alt_alpha[25])

alt_word_parse_num = [alt_alpha.index(i) for i in word]
alt_word_parse = [alt_alpha.index(i) + 97 for i in word]
print(alt_word_parse)

alt_word_parse = "".join([chr(num) for num in alt_word_parse])
print(alt_word_parse)