module app;

import serverino;
import std.datetime: Duration, seconds;
import std.array: split;
import std.algorithm: startsWith;

mixin ServerinoMain;

@onServerInit ServerinoConfig configure()
{
	return ServerinoConfig
		.create()
        .setHttpTimeout(15.seconds)
        .enableKeepAlive(180.seconds)
   		.addListener("0.0.0.0", 3000)
        .setDaemonInstances(4)
		.setWorkers(4);
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
