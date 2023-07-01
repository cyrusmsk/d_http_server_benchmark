import arsd.cgi;
import std.algorithm: startsWith;

void handler(Cgi cgi) {
    cgi.setResponseContentType("text/plain");

    if (startsWith(cgi.pathInfo, "/user")) {
        if (cgi.requestMethod == Cgi.RequestMethod.POST)
            cgi.write("", true);
        else
            cgi.write(cgi.pathInfo[6..$], true);
    }
    else
        cgi.write("", true);
}

//mixin GenericMain!handler;
void main() {
    auto server = RequestServer(3000);
    server.useFork = false;
    server.serve!handler;
}
