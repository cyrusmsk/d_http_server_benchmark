import prism.server;

void main(string[] args) {
    auto app = new PrismApplication();
    app.get("/", (context) => text(""));
    app.get("/user/:id", (context) {
            auto id = context.params["id"];
            return text(id);
        });
    app.post("/user", (context) => text(""));
    app.run();
}

