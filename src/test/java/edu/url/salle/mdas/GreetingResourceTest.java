package edu.url.salle.mdas;

import org.junit.jupiter.api.Test;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;

class GreetingResourceTest {

    private final GreetingResource greetingResource = new GreetingResource();

    @Test
    void when_helloWithoutParams_then_greetingWithoutName() {
        assertEquals("Hello from Quarkus REST", greetingResource.hello(Optional.empty()));
    }

    @Test
    void when_helloWithoutParam_then_greetingToGivenName() {
        assertEquals("Hello Alex from Quarkus REST", greetingResource.hello(Optional.of("Alex")));
    }
}