package sampleRestAPI;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.*;
public class TestRunner {

    @Test
    Karate runTest1()
    {
       return Karate.run("DeckOfcards")
               .relativeTo(getClass())
              // .tags("@shuffleDrawCards")
               ;
    }


    @Test
    Karate runTest3()
    {
        return Karate.run("Sample2","Sample","DeckOfcards",
                "JobPortal","SampleE2E")
                .relativeTo(getClass())
                .tags("@ChatCreateUserE2E")
               ;
    }


}
