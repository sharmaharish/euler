from collections import Counter
from utility import digits_to_number, is_prime, number_to_digits, gen_primes_in_range

def find_other_primes(p, ds, cd):
    pl = []
    for i in xrange(0, 10):
        num = digits_to_number(map(lambda n: n if n != cd else i, ds))
        if num > 0 and p / num < 10 and is_prime(num):
            pl.append(num)
    return set(pl)

if __name__ == "__main__":
    ps = {}
    for i in gen_primes_in_range(10000, 1000000):
        ds = number_to_digits(i)
        counter = Counter(ds)
        if i in ps or counter.most_common(1)[0][1] < 3 :
            continue
        pl = find_other_primes(i, ds, counter.most_common(1)[0][0])
        ps.update({p: pl for p in pl})
        if len(pl) >= 8:
            print(i, ds, pl)
            break
