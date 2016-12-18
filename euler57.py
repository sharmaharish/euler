from fractions import Fraction
from utility import count_digits

c = 0
n = Fraction(1, 2)
for i in xrange(1, 1001):
    t = 1 + n
    c += int(count_digits(t.numerator) > count_digits(t.denominator))
    n = 1 / (2 + n)

print c
