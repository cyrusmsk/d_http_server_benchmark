import std.algorithm : startsWith;

import ae.net.asockets;
import ae.net.http.common;
import ae.net.http.responseex;
import ae.net.http.server;
import ae.net.ietf.headers;
import ae.sys.shutdown;
import ae.utils.funopt;
import ae.utils.main;

void httpserve(
	ushort port = 3000, string host = "0.0.0.0",
	string sslCert = null, string sslKey = null,
	string userName = null, string password = null,
	bool stripQueryParameters = false,
)
{
	HttpServer server;

    server = new HttpServer();

    server.handleRequest = (req, conn)
    {
        auto response = new HttpResponseEx();
        auto path = decodeUrlParameter(req.resource[0..$]);

        if (!path.startsWith("/user"))
        {
            response.status = HttpStatusCode.NotFound;
            conn.sendResponse(response.serveText(""));
        }
        else if (req.method == "POST")
        {
            response.status = HttpStatusCode.OK;
            conn.sendResponse(response.serveText(""));
        }
        else
        {
            response.status = HttpStatusCode.OK;
            conn.sendResponse(response.serveText(path[6..$]));
        }

    };

	server.listen(port, host);
	addShutdownHandler((reason) { server.close(); });

	socketManager.loop();
}

mixin main!(funopt!httpserve);
