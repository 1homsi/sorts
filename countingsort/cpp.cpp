#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

vector<int> countingSort(vector<int> arr) {
    if (arr.empty()) return arr;
    int max = *max_element(arr.begin(), arr.end());
    int min = *min_element(arr.begin(), arr.end());
    int range = max - min + 1;
    vector<int> count(range, 0);
    for (int v : arr) count[v - min]++;
    for (int i = 1; i < range; i++) count[i] += count[i - 1];
    vector<int> output(arr.size());
    for (int i = arr.size() - 1; i >= 0; i--) {
        output[--count[arr[i] - min]] = arr[i];
    }
    return output;
}

int main() {
    vector<int> arr = {4, 2, 2, 8, 3, 3, 1};
    arr = countingSort(arr);
    for (int v : arr) cout << v << " ";
    cout << endl;
    return 0;
}
