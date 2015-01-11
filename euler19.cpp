#include <iostream>

using namespace std;

int dow(int y, int m, int d)
{
    static int t[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};
    y -= m < 3;
    return (y + y/4 - y/100 + y/400 + t[m-1] + d) % 7;
}

int main()
{
    int y = 1901;
    int m = 1;

    int count = 0;
    while (y < 2001) {
        if (dow(y, m, 1) == 0)
            count++;
        if (++m > 12) {
            m = 1;
            y++;
        }
    }

    cout << count << endl;
    return 0;
}
