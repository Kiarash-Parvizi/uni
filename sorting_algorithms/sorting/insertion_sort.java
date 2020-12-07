package sorting;

public final class insertion_sort {
    public static int[] sort(int[] arr) {
        for (int i = 1; i < arr.length; i++) {
            if (arr[i] < arr[i-1]) {
                for (int j = i-1; j >= 0 && arr[j] > arr[j+1]; j--) {
                    int tmp = arr[j];
                    arr[j] = arr[j+1];
                    arr[j+1] = tmp;
                }
            }
        }
        return arr;
    }
}
