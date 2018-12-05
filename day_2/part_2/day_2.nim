import streams
import tables
import strutils
import sequtils
import sugar
import typetraits


proc difference(a: string, b: string): seq[char] = 
  for v in zip(a, b):
    if v.a != v.b: 
      result.add(v.a)
      result.add(v.b)


proc union(a: string, b: string): seq[char] =
  for v in zip(a,b):
    if v.a == v.b:
      result.add(v.a)


let
  ids = openFileStream("day_2_input.txt", fmRead)


if not is_nil(ids):
  var
    line: TaintedString
    checking_line: TaintedString
    line_pos: int = 27  # position by char
    found: string

  # stream position is by number of chars, including line literals (LF CRLF)
  while ids.read_line(line):

    if ids.get_position() == line_pos:
      checking_line = line
      continue

    # echo ids.get_position(), " ", line_pos, " ", checking_line, " ", line

    let uni = union(checking_line, line)

    if len(uni) == 25:
      found = cast[string](uni)
      
    if ids.at_end():
      ids.set_position(line_pos)
      line_pos += len(line) + 1

  echo found

  ids.close()
