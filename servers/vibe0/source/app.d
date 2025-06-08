import vibe.appmain;
import vibe.http.server;
import std.algorithm: startsWith;
import vibe.core.core : runEventLoop;

void handleRequest(scope HTTPServerRequest req, scope HTTPServerResponse res)
{
	if (req.requestURL == "/")
		res.writeBody("", "text/plain");
    else if (startsWith(req.requestURL,"/user")) {
        if (req.method == HTTPMethod.POST)
		    res.writeBody("", "text/plain");
        else if (req.method == HTTPMethod.GET)
            res.writeBody(req.requestURL[6..$], "text/plain");
    }
}

void main()
{
    try {
        auto settings = new HTTPServerSettings;
        settings.port = 3000;
        settings.disableHTTP2 = false;
        settings.bindAddresses = ["0.0.0.0"];
        listenHTTP(settings, &handleRequest);
        runEventLoop();
    } catch (Exception e) assert(false, e.msg);
}
