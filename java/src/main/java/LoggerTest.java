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
      if(rnd.nextInt(10) != 0) {
        logger.info(rndString());
      } else {
        logger.error(rndString(), rndException());
      }
      Thread.sleep(1000);
    }
  }

  public static void addMDC() {
    int n = 1 + rnd.nextInt(5);
    for(int i=0; i<n; i++) {
      MDC.put("mdc"+i, rndString());
    }
  }

  public static Exception rndException() {
    switch(rnd.nextInt(5)) {
      case 1: return new InterruptedException(rndString());
      case 2: return new ClassNotFoundException(rndString());
      case 3: return new NoSuchFieldException(rndString());
      case 4: return new IllegalArgumentException(rndString(), rndException());
    }
    return new Exception(rndString(), rndException());
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
