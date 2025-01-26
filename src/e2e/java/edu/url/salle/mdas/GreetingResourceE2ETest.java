package edu.url.salle.mdas;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static org.hamcrest.Matchers.is;

@QuarkusTest
public class GreetingResourceE2ETest extends AbstractE2ETest {

    @Test
    void when_helloWithoutParams_then_greetingWithoutName() {
        givenEnvUri()
                .when().get("/hello")
                .then()
                .statusCode(200)
                .body(is("Hello from Quarkus REST"));
    }

    @Test
    void when_helloWithoutParam_then_greetingToGivenName() {
        givenEnvUri()
                .when().queryParam("name", "Alex").get("/hello")
                .then()
                .statusCode(200)
                .body(is("Hello Alex from Quarkus REST"));
    }
}
