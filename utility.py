import math

def number_to_digits(n):
    ds = []
    n = abs(n)
    while n > 0:
        ds.append(n % 10)
        n /= 10
    ds.reverse()
    return ds

def digits_to_number(ds):
    def fn(n, d):
        return (n * 10) + d
    return reduce(fn, ds, 0)

def is_prime(n):
    if n < 2:
        return False
    for i in xrange(2, int(math.pow(n, 0.5)) + 1):
        if n % i == 0:
            return False
    return True

def gen_primes(start = 2):
    n = start
    while True:
        if is_prime(n):
            yield n
        n += 1 if n % 2 == 0 else 2

def gen_primes_in_range(start, end):
    for p in gen_primes(start):
        if start <= p <= end:
            yield p
        else:
            break;
