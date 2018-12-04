import tables
import strutils
import sequtils
import sugar
import typetraits


var
  twice_appears: seq[string]
  trice_appears: seq[string]
  test_appears: CountTable[char]
  occurances: CountTable[char]

test_appears = initCountTable[char]()

let test_string = "ymdrchgpvwfloguktqlxzjsqeb"

for c in test_string:
  test_appears.inc(c)

echo test_appears

let testing = lc[y | (y <- test_appears.values(), y > 1), int]

echo testing.deduplicate()

for line in lines("day_2_input.txt"):
  occurances = initCountTable[char]()

  for c in line:
    occurances.inc(c)

  let multiples = lc[y | (y <- occurances.values(), y > 1), int]
  let appearences = multiples.deduplicate()

  for v in appearences:
    if v == 2: twice_appears.add(line)
    if v == 3: trice_appears.add(line)

echo "Checksum: ", len(twice_appears) * len(trice_appears)


