package sorting;

import java.util.Random;

public final class shuffle {
    // Fisher–Yates shuffle
    public static void array(int[] ar) {
    Random rnd = new Random();
        for (int i = ar.length - 1; i > 0; i--) {
            int index = rnd.nextInt(i + 1);
            // swap
            int a = ar[index];
            ar[index] = ar[i];
            ar[i] = a;
        }
    }
}
