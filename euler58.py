from utility import is_prime

i = 1
d = 2
np = 0
nc = 1

while True:
    npl = [p for p in xrange(i + d, i + 4 * d + 1, d) if is_prime(p)]
    np += len(npl)
    nc += 4
    if np / float(nc) < .1:
        print 'Side length = ', d + 1, ', prime count = ', np, ', diagonal count = ', nc
        break
    i += d * 4
    d += 2
