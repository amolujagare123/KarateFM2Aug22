package examples.users;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.*;
class UsersRunner {
    
    @Test
    Karate testUsers() {
        return Karate.run("users");//.relativeTo(getClass());
    }    

}
