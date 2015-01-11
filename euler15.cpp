#include <iostream>
#include <iomanip>
#include <vector>

using namespace std;

struct Lattice
{
    Lattice(int sz)
        : size_(sz + 2)
        , lattice_(sz + 2 * sz + 2)
        , start_node_(size_ + 1)
        , final_node_(size_ * size_ - size_ - 2)
    {
        for (int i = 0; i < size_ * size_; ++i)
            lattice_[i] =
                (i > size_) &&
                (i % size_ != 0) &&
                ((i + 1) % size_ != 0) &&
                (i < size_ * (size_ - 1));
    }

    bool findPathsImpl(unsigned long& count, int current_node)
    {
        if (current_node == final_node_) {
            count++;
            (count % 1000000000UL == 0) && cout << count << "\n";
        }
        else {
            lattice_[current_node + 1] && findPathsImpl(count, current_node + 1);
            lattice_[current_node + size_] && findPathsImpl(count, current_node + size_);
        }

        return true;
    }

    unsigned long findPaths()
    {
        unsigned long count = 0;
        findPathsImpl(count, start_node_);
        return count;
    };

    const int size_;
    const int start_node_;
    const int final_node_;
    vector<bool> lattice_;
};

int main()
{
    const int sz = 21;
    Lattice lat(sz);

    cout << "\nno.of paths for " << sz - 1
         << " x " << sz - 1
         << " grid are " << lat.findPaths() << endl;

    return 0;
}
