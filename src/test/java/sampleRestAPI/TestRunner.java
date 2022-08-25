package sampleRestAPI;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.*;
public class TestRunner {

    @Test
    Karate runTest()
    {
       return Karate.run("Sample").relativeTo(getClass()).tags("@getAllJobUsers");
    }
}
