package endpoints;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.BeforeEach;

public class ApiRunner {
    @BeforeEach
    public void before() {
        System.setProperty("karate.env", "dev");
    }

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

}
