package edu.url.salle.mdas;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;

import java.util.Optional;

@Path("/hello")
public class GreetingResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello(@QueryParam("name") Optional<String> optionalName) {
        return optionalName
                .map("Hello %s from Quarkus REST"::formatted)
                .orElse("Hello from Quarkus REST");
    }
}
