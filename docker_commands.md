# Docker commands
To build:

```bash
docker build -t httptest .
```

To run:

```bash
docker run -d -p 3000:3000 --name http-container httptest
```

# Bombardier commands
To run benchmark:

```bash
bombardier -c 200 -d 10s -l http://127.0.0.1
```
