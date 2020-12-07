package sorting;

public final class radix_sort {
    private static void countSort(int[] arr, int e) {
        int[] res = new int[arr.length];
        int i; int[] count = new int[10];
        // Store count
        for (i = 0; i < arr.length; i++)
            count[(arr[i] / e) % 10]++;
        for (i = 1; i < 10; i++)
            count[i] += count[i-1];
        // Build the res array
        for (i = arr.length - 1; i >= 0; i--) {
            res[count[(arr[i] / e) % 10] - 1] = arr[i];
            count[(arr[i] / e) % 10]--;
        }
        for (i = 0; i < arr.length; i++)
            arr[i] = res[i];
    }
    public static int[] sort(int[] arr) {
        if (arr.length < 2) return arr;
        // finding max
        int mx = arr[0];
        int mn = arr[0];
        for (int v: arr) { mn = Math.min(mn, v); mx = Math.max(mx, v); }
        //
        boolean mapped = false;
        if (mn < 0) {
            mx -= mn;
            mapped = true;
            for (int i = 0; i < arr.length; i++) {
                arr[i] -= mn;
            }
        }
        for (int e = 1; mx / e > 0; e*=10) countSort(arr, e);
        if (mapped) {
            for (int i = 0; i < arr.length; i++) {
                arr[i] += mn;
            }
        }
        return arr;
    }
}
