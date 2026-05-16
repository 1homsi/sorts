import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 300
    height: 200

    function insertionSort(arr) {
        var a = arr.slice();
        var n = a.length;
        for (var i = 1; i < n; i++) {
            var key = a[i];
            var j = i - 1;
            while (j >= 0 && a[j] > key) {
                a[j + 1] = a[j];
                j--;
            }
            a[j + 1] = key;
        }
        return a;
    }

    Column {
        Button {
            text: "Sort"
            onClicked: resultLabel.text = insertionSort([5, 3, 1, 4, 2]).join(", ")
        }
        Label { id: resultLabel; text: "" }
    }
}
