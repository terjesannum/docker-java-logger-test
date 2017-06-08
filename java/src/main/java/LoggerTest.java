import java.util.Random;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;

public class LoggerTest {

  final static Logger logger = LoggerFactory.getLogger(LoggerTest.class);
  final static Random rnd = new Random();

  public static void main(String args[]) throws Exception {
    while(true) {
      MDC.clear();
      if(rnd.nextBoolean()) addMDC();
      logger.info(rndString());
      Thread.sleep(1000);
    }
  }

  public static void addMDC() {
    int n = 1 + rnd.nextInt(5);
    for(int i=0; i<n; i++) {
      MDC.put("mdc"+i, rndString());
    }
  }

  public static String rndString() {
    int length = 10+rnd.nextInt(30);
    StringBuilder word = new StringBuilder(length);
    for(int i=0; i<length; i++) {
      word.append((char)('a' + rnd.nextInt(26)));
    }
    return word.toString();
  }

}
