package sorting;

public final class counting_sort {
    public static int[] sort(int[] arr) {
        if (arr.length < 2) return arr;
        int mn = arr[0], mx = arr[0];
        for (int v : arr) {
            mn = Math.min(mn, v);
            mx = Math.max(mx, v);
        }
        boolean mapped = false;
        if (mn < 0) {
            mapped = true;
            mx -= mn;
            for (int i = 0; i < arr.length; i++) {
                arr[i] -= mn;
            }
        }
        // sort
        int[] cnt = new int[mx+1];
        int[] res = new int[arr.length];
        for (int i = 0; i < arr.length; i++) {
            cnt[arr[i]]++;
        }
        for (int i = 1; i < cnt.length; i++) {
            cnt[i] += cnt[i-1];
        }
        for (int i = 0; i < arr.length; i++) {
            res[--cnt[arr[i]]] = arr[i];
        }
        //
        if (mapped) {
            for (int i = 0; i < arr.length; i++) {
                res[i] += mn;
            }
        }
        // asn
        for (int i = 0; i < res.length; i++) {
            arr[i] = res[i];
        }
        return arr;
    }
}
