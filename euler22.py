import fileinput

total = 0
position = 1

for entry in fileinput.input():
    total += position * sum([ord(c) - 64 for c in entry.strip()])
    position += 1

print "Total score is ", total
