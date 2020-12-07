package sorting;

import java.util.Arrays;

public final class merge_sort {
    public static int[] sort(int[] arr) {
        if (arr.length <= 1) return arr;
        int mid = arr.length/2;
        int[] L = Arrays.copyOfRange(arr, 0, mid);
        int[] R = Arrays.copyOfRange(arr, mid, arr.length);
        sort(L);
        sort(R);
        int i = 0, j = 0, k = 0;
        while (i < L.length && j < R.length) {
            if (L[i] < R[j]) {
                arr[k++] = L[i++];
            } else {
                arr[k++] = R[j++];
            }
        }
        while (i < L.length) {
            arr[k++] = L[i++];
        }
        while (j < R.length) {
            arr[k++] = R[j++];
        }
        return arr;
    }
}
