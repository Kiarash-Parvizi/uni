import java.util.*;
import java.util.function.Consumer;

import ascii_table.*;
import sorting.*;

public class program {

    static void bm_algo(String name, String[][] tableBody, int rowIdx, int[] arr, int n) {
        System.out.println("--------> " + name);
        int[] tmp_arr = arr.clone();
        //System.out.println(name);
        //printer.print(tmp_arr);
        // get sorting method
        Consumer<int[]> sort = (a) -> {
            //printer.print(a);
            switch(name) {
                case "Tree Sort":
                    //System.out.println("Tree");
                    a = tree_sort.sort(a);
                    break;
                case "Radix Sort":
                    //System.out.println("Radix");
                    a = radix_sort.sort(a);
                    break;
                case "Counting Sort":
                    //System.out.println("Counting");
                    a = counting_sort.sort(a);
                    break;
                case "Heap Sort":
                    //System.out.println("Heap");
                    a = heap_sort.sort(a);
                    break;
                case "Quick Sort":
                    //System.out.println("Quick");
                    a = quick_sort.sort(a);
                    break;
                case "Merge Sort":
                    //System.out.println("Merge");
                    a = merge_sort.sort(a);
                    break;
                case "Insertion Sort":
                    //System.out.println("Insertion");
                    a = insertion_sort.sort(a);
                    break;
                case "Bubble Sort":
                    //System.out.println("Bubble");
                    a = bubble_sort.sort(a);
                    break;
            }
        };
        // duration1
        long t0 = System.currentTimeMillis();
        sort.accept(tmp_arr);
        long duration1 = System.currentTimeMillis() - t0;
        //printer.print(tmp_arr);
        // duration2
        t0 = System.currentTimeMillis();
        sort.accept(tmp_arr);
        long duration2 = System.currentTimeMillis() - t0;
        // asn
        String[] row = tableBody[rowIdx];
        row[0] = String.valueOf(n);
        row[1] = name;
        row[2] = String.valueOf(duration1);
        row[3] = String.valueOf(duration2);
    }

    public static void main(String[] args) {
        System.out.println("\n\t Sorting Algorithms by Kiarash Parvizi\n");
        Scanner in = new Scanner(System.in);
        while (true) {
            System.out.print("N: ");
            int n = in.nextInt();
            if (n == 0) {
                System.out.println("Bye :)");
                break;
            }
            // setting the array
            int[] arr = new int[n];
            Random rGen = new Random();
            for (int i = 0; i < n; i++) {
                arr[i] = rGen.nextInt(n*2);
            }
            //
            String[] header = {"N", "Algorithm", "Time#1 (ms)", "Time#2 (ms)"};
            String[][] body = new String[8][4];
            bm_algo("Insertion Sort", body, 0, arr, n);
            bm_algo("Bubble Sort", body, 1, arr, n);
            bm_algo("Merge Sort", body, 2, arr, n);
            bm_algo("Quick Sort", body, 3, arr, n);
            bm_algo("Heap Sort", body, 4, arr, n);
            bm_algo("Counting Sort", body, 5, arr, n);
            bm_algo("Radix Sort", body, 6, arr, n);
            bm_algo("Tree Sort", body, 7, arr, n);
            // print as table
            ASCIITable.getInstance().printTable(header, body);
        }
        in.close();
    }
}
