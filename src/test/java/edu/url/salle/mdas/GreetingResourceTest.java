package edu.url.salle.mdas;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class GreetingResourceTest {

    private final GreetingResource greetingResource = new GreetingResource();

    @Test
    void testHelloEndpoint() {
        assertEquals("Hello from Quarkus REST", greetingResource.hello());
    }
}