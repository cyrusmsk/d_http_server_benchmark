import hunt.http;
import std.datetime;

void main()
{
    auto server = HttpServer.builder()
        .setListener(3000, "0.0.0.0")
        .setHandler((RoutingContext context) {
            context.end("Hello");
        }).build();

    server.start();
}
