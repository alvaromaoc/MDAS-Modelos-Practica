package edu.url.salle.mdas;

import io.quarkus.test.junit.QuarkusTest;
import io.restassured.specification.RequestSpecification;

@QuarkusTest
public class AbstractE2ETest {

    protected final String BASE_URI = "https://modelos-%s-alvaro-manoso-salle-dev.apps.rm2.thpm.p1.openshiftapps.com".formatted(System.getenv("E2E_ENV"));

    protected RequestSpecification givenEnvUri() {
        return io.restassured.RestAssured.given().baseUri(BASE_URI).port(443);
    }
}
