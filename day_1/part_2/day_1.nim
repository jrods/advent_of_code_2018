import streams
import strutils

# test array
# let frequencies: array[6, string] = [
#     "+6", "-4", "-10", "-30", "+600", "+1"]

var
  result: int = 0
  previous_set_frequences: seq[int] = @[0]
  line: TaintedString
  times_iter: int = 0

let
  frequencies = openFileStream("day_1_input.txt", fmRead)


if not isNil(frequencies):
  while frequencies.read_line(line):
    let freq: int = parse_int(line)

    result += freq

    if result in previous_set_frequences:
      echo "Found a previous set frequency: ", result
      break
    else:
      previous_set_frequences.add(result)

    if frequencies.at_end():
      times_iter += 1
      echo "times iterated: ", times_iter
      frequencies.set_position(0)

  frequencies.close()


