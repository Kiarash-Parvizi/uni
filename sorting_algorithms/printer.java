public final class printer {
    public static void print(int[] arr) {
        System.out.print("[ ");
        for (int v : arr) {
            System.out.print(v);
            System.out.print(' ');
        }
        System.out.print("]\n");
    }
}
