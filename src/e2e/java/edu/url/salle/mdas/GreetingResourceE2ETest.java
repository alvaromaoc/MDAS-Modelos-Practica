package edu.url.salle.mdas;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static org.hamcrest.Matchers.is;

@QuarkusTest
public class GreetingResourceE2ETest extends AbstractE2ETest {

    @Test
    void testGreeting() {
        givenEnvUri()
                .when().get("/hello")
                .then()
                .statusCode(200)
                .body(is("Hello from Quarkus REST"));
    }
}
