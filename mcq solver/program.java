import java.util.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.charset.StandardCharsets;

public class program {

    public static void main(String[] args) {
        //test.synset();
        System.out.println("\t\tmcq solver by Kiarash Parvizi\n");
        try {
            // class init
            Synset synset = new Synset("D:/Program Files (x86)/WordNet/2.1/dict");
            Scanner conScanner = new Scanner(System.in);
            // read data
            String fileData = Files.readString(Paths.get("data/text_data.dat"), StandardCharsets.UTF_8);
            fileData = fileData.replaceAll("[^\\x00-\\x7F]", " ");
            fileData = fileData.replace("\n", " ").replace(",", " ").replace(".", "");
            String[] data = fileData.toLowerCase().split("\\s+");
            System.out.print("question: ");
            String[] question = conScanner.nextLine().replace("?", "").toLowerCase().split(" ");
            String[][] ch = new String[4][];
            for (int i = 0; i < 4; i++) {
                System.out.print("ch." + (i+1) + ": ");
                ch[i] = conScanner.nextLine().toLowerCase().split(" ");
            }
            Solver solver = new Solver(synset, data, question, ch);
            System.out.println("\nanswer: " + solver.solve());
        } catch(Exception e) {
            System.out.println("err at line " + e.getStackTrace()[0].getLineNumber() + " : " + e);
        }
    }
}
