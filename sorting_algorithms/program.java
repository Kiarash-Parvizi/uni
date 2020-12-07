import java.io.Console;
import java.util.*;
import sorting.*;

public class program {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        //int n = in.nextInt();
        int[] arr = { 7, 4, 8, 2, -1, 2, -11, 3 };
        arr = tree_sort.sort(arr);
        arr = radix_sort.sort(arr);
        arr = counting_sort.sort(arr);
        arr = heap_sort.sort(arr);
        arr = quick_sort.sort(arr);
        arr = merge_sort.sort(arr);
        arr = insertion_sort.sort(arr);
        arr = bubble_sort.sort(arr);
        printer.print(arr);
    }
}