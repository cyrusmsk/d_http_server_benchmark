import ninox.web;
import std.socket;
//import std.datetime : dur;

mixin NinoxWebMain!app;

@OnServerStart
void configureServer(ServerConfig conf) {
    conf.addr = new InternetAddress("0.0.0.0", 3000);
    // conf.keep_alive_timeout = dur!"seconds"(10);
}

@GET @Route("/")
Response emptyUri() {
    auto resp = Response.build_200_OK();
    return resp;
}

@POST @Route("/users")
Response usersPost() {
    auto resp = Response.build_200_OK();
    return resp;
}

@GET @Route("/user/:userid")
Response getUser(@PathParam string userid) {
    auto resp = Response.build_200_OK();
    resp.setBody(userid);
    return resp;
}
