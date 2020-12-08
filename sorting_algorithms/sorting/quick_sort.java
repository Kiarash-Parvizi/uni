package sorting;

import java.util.*;

public final class quick_sort {
    static Random rGen = new Random();

    private static int partition(int[] arr, int l, int r) {
        // swap arr[r-1], arr[rand]
        {
            int rIdx = rGen.nextInt(r-1-l) + l;
            int tmp = arr[rIdx]; arr[rIdx] = arr[r-1]; arr[r-1] = tmp;
        }
        // rest
        int pivot = arr[r-1];
        int i = l;
        for (int j = l; j < r-1; j++) {
            if (arr[j] < pivot) {
                if (i == j) {
                    i++;
                } else {
                    int tmp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = tmp;
                    i++;
                }
            }
        }
        // swap a[r-1], a[i]
        int tmp = arr[r-1]; arr[r-1] = arr[i]; arr[i] = tmp;
        return i;
    }
    private static void qsort(int[] arr, int l, int r) {
        if (l+1 < r) {
            //System.out.println("--------");
            //System.out.println(l);
            //System.out.println(r);
            //for (int v : arr) { System.out.print(v); System.out.print(' '); } System.out.println(' ');
            int piv = partition(arr, l, r);
            //System.out.println(piv);
            //for (int v : arr) { System.out.print(v); System.out.print(' '); } System.out.println(' ');
            qsort(arr, l, piv);
            qsort(arr, piv+1, r);
        }
    }
    public static int[] sort(int[] arr) {
        qsort(arr, 0, arr.length);
        return arr;
    }
}
