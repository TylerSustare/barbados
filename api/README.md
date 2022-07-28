A simple Dart HTTP server using [package:shelf](https://pub.dev/packages/shelf).

- Listens on "any IP" (0.0.0.0) instead of loop-back (localhost, 127.0.0.1) to
  allow remote connections.
- Defaults to listening on port `8080`, but this can be configured by setting
  the `PORT` environment variable. (This is also the convention used by
  [Cloud Run](https://cloud.google.com/run).)
- Includes `Dockerfile` for easy containerization

To deploy on [Cloud Run](https://cloud.google.com/run), follow
[these instructions](https://cloud.google.com/run/docs/quickstarts/build-and-deploy/other).

To run this server locally with hot reloading, run as follows:

```bash
$ ENV=dev dart run --enable-vm-service bin/api.dart
```

To run the server locally as it will run in production:

```bash
$ dart run
```

To deploy on [fly.io](https://fly.io). Use the Fly command line with the `--local-only` to use your local Docker.

```bash
$ fly deploy --local-only
```

Running without `--local-only` will cause a failed build for `ERRO[0111] Can't close tar writer: io: read/write on closed pipe`
