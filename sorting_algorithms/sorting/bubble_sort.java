package sorting;

public final class bubble_sort {
    public static int[] sort(int[] arr) {
        while (true) {
            boolean changed = false;
            for (int i = 1; i < arr.length; i++) {
                if (arr[i-1] > arr[i]) {
                    int tmp = arr[i-1];
                    arr[i-1] = arr[i];
                    arr[i] = tmp;
                    // set changed var to true
                    changed = true;
                }
            }
            if (!changed) break;
        }
        return arr;
    }
}
