# Docker commands
To build:

```bash
docker build -t httptest .
```

To run:

```bash
docker run -d -p 3000:3000 --name http-container httptest
```
