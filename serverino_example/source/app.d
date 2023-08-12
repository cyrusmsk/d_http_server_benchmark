module app;

import serverino;
import std.parallelism: totalCPUs;
import std.array: split;
import std.algorithm: startsWith;

mixin ServerinoMain;

@onServerInit ServerinoConfig configure()
{
	return ServerinoConfig
		.create()
   		.addListener("127.0.0.1", 3000)
        .enableKeepAlive()
		.setWorkers(16);
}

@endpoint void hello(Request req, Output output) {
    if (req.uri == "/" && req.method == Request.Method.Get)
        output ~= "";
    else if (req.uri == "/user" && req.method == Request.Method.Post)
        output ~= "";
    else {
        if (req.uri.startsWith("/user/") && req.method == Request.Method.Get)
            output ~= req.uri.split("/user/")[1];
    }
}
