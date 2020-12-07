package sorting;

public final class heap_sort {
    private static void heapify(int[] arr, int n, int i) {
        int largest = i;
        int l = 2*i + 1; // left = 2*i + 1
        int r = 2*i + 2;
        if (l < n && arr[l] > arr[largest]) largest = l;
        if (r < n && arr[r] > arr[largest]) largest = r;
        if (largest != i) {
            // swap
            int tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
            //
            heapify(arr, n, largest);
        }
    }
    public static int[] sort(int[] arr) {
        for (int i = arr.length/2 - 1; i >= 0; i--) heapify(arr, arr.length, i);
        for (int i = arr.length-1; i > 0; i--) {
            // swap
            int tmp = arr[i]; arr[i] = arr[0]; arr[0] = tmp;
            //
            heapify(arr, i, 0);
        }
        return arr;
    }
}
