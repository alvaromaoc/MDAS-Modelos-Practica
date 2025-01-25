package edu.url.salle.mdas;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
class GreetingResourceIT {

    @Test
    void when_helloWithoutParams_then_greetingWithoutName() {
        given()
                .when().get("/hello")
                .then()
                .statusCode(200)
                .body(is("Hello from Quarkus REST"));
    }

    @Test
    void when_helloWithoutParam_then_greetingToGivenName() {
        given()
                .when().queryParam("name", "Alex").get("/hello")
                .then()
                .statusCode(200)
                .body(is("Hello Alex from Quarkus REST"));
    }
}