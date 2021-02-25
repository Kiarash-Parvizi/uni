import java.util.*;

public class Solver {
    // class variables
    Set<String> questionSubs;
    Set<String>[] chSubs;
	Set<String> syncategorematic = new HashSet<String>();
    String[] data;
    // constructor
    @SuppressWarnings("unchecked")
    public Solver(Synset synset, String[] data, String[] question, String[][] choices) {
		syncategorematic.add("the");
		syncategorematic.add("which");
		syncategorematic.add("where");
		syncategorematic.add("something");
		syncategorematic.add("and");
		syncategorematic.add("some");
        this.questionSubs = new HashSet<String>();
        for (String[] choice : choices) {
            for (var s: choice) {
            	if (s.length() < 3 || syncategorematic.contains(s)) continue;
                questionSubs.add(s);
            }
        }
        for (int i = 0; i < question.length; i++) {
            var s = question[i];
            if (s.length() < 3 || syncategorematic.contains(s)) continue;
            var syns = synset.getSyns(s);
            for (var syn: syns) {
                questionSubs.add(syn);
            }
        }
        chSubs = new Set[choices.length];
        for (int i = 0; i < choices.length; i++) {
            this.chSubs[i] = new HashSet<String>();
			for (var s: choices[i]) {
            	if (s.length() < 3 || syncategorematic.contains(s)) continue;
				this.chSubs[i].add(s);
			}
        }
        for (var s: questionSubs) System.out.println(":: " + s);
        this.data = data;
    }
    public int solve() {
        final int batchLen = 20;
        int[] matchCnt_dp = new int[data.length];
        Map<String, Integer> lastPlc = new HashMap<String, Integer>();
        for (int i = 1; i < data.length; i++) {
            boolean canCheck = true;
            if (lastPlc.containsKey(data[i]) && lastPlc.get(data[i]) >= i-batchLen/2) {
                //System.out.println("canCheck : " + data[i] + ", " + (i-batchLen/2) + ". " + lastPlc.get(data[i]) + " | " + data[lastPlc.get(data[i])]);
                canCheck = false;
            }
            if (!canCheck) continue;
            lastPlc.put(data[i], i);
            if (stringUtil.contains(questionSubs, data[i])) {
                matchCnt_dp[i] = matchCnt_dp[i-1] + 1;
            } else {
                matchCnt_dp[i] = matchCnt_dp[i-1];
            }
        }
        int mxBatchMatch = 0, mxBatchIdx = batchLen;
        int mx_ch = -1;
        for (int i = batchLen; i < data.length; i++) {
            int matchCnt = matchCnt_dp[i] - matchCnt_dp[i-batchLen];
            if (matchCnt > mxBatchMatch) {
                mxBatchIdx = i;
                mxBatchMatch = matchCnt;
            }
        }
        int mxMatch = 0;
        for (int chI = 0; chI < chSubs.length; chI++) {
            int matchCnt = 0;
            System.out.println("chI: " + chI + "\n");
            for (int i = mxBatchIdx - batchLen + 1; i <= mxBatchIdx+batchLen; i++) {
                System.out.println("data : " + data[i]);
                if (stringUtil.contains(chSubs[chI], data[i])) {
                    System.out.println(":: contains " + data[i]);
                    matchCnt++;
                }
            }
            if (matchCnt > mxMatch ) {
                mx_ch = chI;
            }
        }
        return mx_ch;
    }
}
