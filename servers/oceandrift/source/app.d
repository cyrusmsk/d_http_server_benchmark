import oceandrift.http.microframework.app;

// listen on port 3000
static immutable listenOn = [
    makeSocketAddress("[::1]", 3000),     // IPv6 loopback address
    makeSocketAddress("127.0.0.1", 3000), // IPv4 loopback address
];

int main() @safe {
    return runFramework(listenOn, delegate(Router router) {
            router.get("/", delegate(Request, Response response) {
                    response.body.write("");
                    return response.withHeader!"Content-Type"("text/plain");
            });
            router.get("/user/:userId", delegate(Request request,
                        Response response, RouteMatchMeta meta) {
                    auto userId = meta.placeholders.get("userId");
                    response.body.write(userId);
                    return response.withHeader!"Content-Type"("text/plain");
            });
            router.post("/user", delegate(Request, Response response) {
                    response.body.write("");
                    return response.withHeader!"Content-Type"("text/plain");
            });
    });
}
