import java.util.*;

public class test {
    static void synset() {
        try {
            Synset synset = new Synset("D:/Program Files (x86)/WordNet/2.1/dict");
            //double simIdx = stringUtil.similarity("kiarash", "kiarash");
            //System.out.println("simIdx: " + simIdx);
            Set<String> syns = synset.getSyns("terrified");
            for (var s: syns) {
                System.out.println(":: " + s);
            }
        } catch(Exception e) {
            System.out.println("err: " + e);
        }
    }
}
