
def reverse(num):
    mun = 0
    while num > 0:
        mun = mun * 10 + num % 10
        num /= 10
    return mun

def is_palindrome(num):
    return num == reverse(num)

def is_lychrel_number(num):
    for i in xrange(1, 50):
        num += reverse(num)
        if is_palindrome(num):
            return False
    return True

if __name__ == "__main__":
    print(sum([int(is_lychrel_number(n)) for n in xrange(1, 10000)]))
