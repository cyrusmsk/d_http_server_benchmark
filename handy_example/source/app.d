import handy_httpd;
import std.algorithm: startsWith;

void main() {
    ServerConfig cfg = ServerConfig.defaultValues();
    cfg.workerPoolSize = 100;
    cfg.port = 3000;
    cfg.reuseAddress = true;

    import slf4d;
    import slf4d.default_provider;
    auto provider = new shared DefaultProvider(true, Levels.ERROR);
    configureLoggingProvider(provider);

    new HttpServer((ref ctx) {
        if (ctx.request.url == "/" && ctx.request.method == Method.GET) {
            ctx.response.writeBodyString("");
        } else if (ctx.request.url == "/user" && ctx.request.method == Method.POST) {
            ctx.response.writeBodyString("");
        } else if (startsWith(ctx.request.url, "/user/") && ctx.request.method == Method.GET) {
            ctx.response.writeBodyString(ctx.request.url[6..$]);
        } else {
            ctx.response.setStatus(HttpStatus.NOT_FOUND);
        }
    }, cfg).start();
}
