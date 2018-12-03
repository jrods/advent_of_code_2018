import strutils

# test array
let frequencies: array[6, string] = [
    "+6", "-4", "-10", "-30", "+600", "+1"]

var
    result: int = 0

for line in lines("day_1_input.txt"):
  let freq: int = parseInt(line)
  result += freq

echo result
