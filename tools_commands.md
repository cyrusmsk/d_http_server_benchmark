# Docker commands
To build:

```bash
docker build -t httptest .
```

To run:

```bash
docker run -d -p 3000:3000 --name http-container httptest
```

# Run locally
To build:

```bash
dub build -b=release --compiler=ldc2
```

# Bombardier commands
To run benchmark:

```bash
bombardier_{OS} -c {connections} -d 10s -l http://127.0.0.1:3000 > results/{OS}/{framework}_{connections}
```
