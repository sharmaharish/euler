from utility import number_to_digits

print(max([sum(number_to_digits(a ** b)) for a in xrange(1, 100) for b in xrange(1, 100)]))
