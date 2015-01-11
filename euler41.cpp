#include <iostream>
#include <cmath>

using namespace std;

typedef unsigned long long uint64;

inline int count_digits(uint64 n)
{
    int c = 1;
    while (n /= 10)
        c++;
    return c;
}

inline bool is_pandigital(uint64 n)
{
    uint64 nn = n;
    int flags = 0;
    while (nn > 0) {
        flags |= (1 << (nn % 10 - 1));
        nn /= 10;
    }
    const int test = (1 << count_digits(n)) - 1;
    return test == (flags & test);
}

inline bool is_prime(uint64 n)
{
    if (n < 2 || n % 2 == 0)
        return false;
    uint64 lmt = sqrt(n);
    for (int i = 3; i <= lmt; i += 2)
        if (n % i == 0)
            return false;
    return true;
}

uint64 pandigital_prime(uint64 n)
{
    uint64 i = (n % 2 == 0)? (n - 1) : (n - 2);
    for (; i >= 2; i -= 2)
        if (is_pandigital(i))
            if (is_prime(i))
                return i;
    return 2;
}

int main()
{
    cout << pandigital_prime(7654321) << endl;
    return 0;
}
