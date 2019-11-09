package platformverification;

import com.intuit.karate.junit5.Karate;


class PlatformTestRunner {
    @Karate.Test
    Karate testAll() {
        return new Karate().relativeTo(getClass());
    }
    
}
