import java.util.*;
import java.io.*;
import java.net.*;
import edu.mit.jwi.IDictionary;
import edu.mit.jwi.Dictionary;
import edu.mit.jwi.item.*;

public class Synset {
    String path; URL url;
    IDictionary dict;

    public Synset(String path) throws IOException {
        this.path = path;
        // construct the URL to the Wordnet dictionary directory
        // path = wnhome + File . separator + "dict";
        url = new URL ("file", null , path ) ;

        // construct the dictionary object and open it
        dict = new Dictionary ( url ) ;
        dict.open();

        // look up first sense of the word "dog "
    }

    public Set<String> getSyns(String obj) {
        Set<String> lexicon = new HashSet<>();
        lexicon.add(obj);
        for (POS p : POS.values()) {
            IIndexWord idxWord = dict.getIndexWord(obj, p);
            if (idxWord != null) {
                IWordID wordID = idxWord.getWordIDs().get(0);
                IWord word = dict.getWord(wordID);
                ISynset synset = word.getSynset();
                for (IWord w : synset.getWords()) {
                    lexicon.add(w.getLemma());
                }
            }
        }
        Set<String> tmp_st = new HashSet<>();
        for (var s: lexicon) {
            if (s.contains("-")) {
                String[] subs = s.split("-");
                for (var su: subs) {
                    tmp_st.add(su);
                }
            }
        }
        for (var s: tmp_st) {
            lexicon.add(s);
        }
        return lexicon;
    }
    
}
