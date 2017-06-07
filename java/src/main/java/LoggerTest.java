import java.util.Random;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggerTest {

  final static Logger logger = LoggerFactory.getLogger(LoggerTest.class);

  public static void main(String args[]) throws Exception {
    while(true) {
      logger.info(rndString());
      Thread.sleep(1000);
    }
  }

  public static String rndString() {
    Random rnd = new Random();
    int length = 10+rnd.nextInt(30);
    StringBuilder word = new StringBuilder(length);
    for(int i=0; i<length; i++) {
      word.append((char)('a' + rnd.nextInt(26)));
    }
    return word.toString();
  }

}
