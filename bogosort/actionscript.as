package {
    import flash.display.Sprite;

    public class Main extends Sprite {
        private function isSorted(arr: Array): Boolean {
            for (var i: int = 0; i < arr.length - 1; i++) {
                if (arr[i] > arr[i + 1]) return false;
            }
            return true;
        }

        private function shuffle(arr: Array): void {
            for (var i: int = arr.length - 1; i > 0; i--) {
                var j: int = int(Math.random() * (i + 1));
                var tmp: int = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
            }
        }

        private function bogosort(arr: Array): Array {
            while (!isSorted(arr)) {
                shuffle(arr);
            }
            return arr;
        }

        public function Main() {
            var arr: Array = [3, 1, 4, 1, 5, 9, 2, 6];
            trace(bogosort(arr));
        }
    }
}
