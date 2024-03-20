import oceandrift.http.microframework.app;

int main(string[] args) @safe {
    return quickstart("oceandrift/http microframework", args, delegate(Router router) {
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
