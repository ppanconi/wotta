# build form the parent dir
# docker build -f wotta_server/Dockerfile .

# Deprecated use Dockerfile in parent dir

FROM google/dart:2.5.0 AS dart-runtime

WORKDIR /app

ADD wotta_server/pubspec.* /app/
RUN pub get
ADD wotta_server/bin /app/bin/
ADD wotta_server/lib /app/lib/
RUN pub get --offline
ADD wotta_web/build /app/web
RUN dart2aot /app/bin/server.dart /app/server.dart.aot

CMD []
ENTRYPOINT ["dartaotruntime", "server.dart.aot", "-s", "web"]

EXPOSE 8080