import std.stdio;
import vibrant.d;

void main(string[] args) {
	auto settings = new HTTPServerSettings;
	settings.port = 3000;
	settings.bindAddresses = ["0.0.0.0"];

    setupWorkerThreads(8);
	auto vib = Vibrant(settings);

	with (vib) {
		Get("/", (req, res) => "");

		Post("/users", (req, res) => "");

		Get("/user/:id", (req, res) =>
				req.params["id"]
		);
	}

	vib.start();

	scope (exit)
		vib.stop();
}
