# build form the parent dir
# docker build -f wotta_server/Dockerfile .

#
# DEPRECATED USE DOCKERFILE IN PARENT DIR
#

FROM google/dart:2.5.0 AS dart-runtime

WORKDIR /app

# we need to run pub get twice
# for the reason see official base image documentation
# @ https://hub.docker.com/r/google/dart

ADD wotta_server/pubspec.* /app/
RUN pub get
ADD wotta_server/bin /app/bin/
ADD wotta_server/lib /app/lib/
RUN pub get --offline
ADD wotta_react/build /app/web
RUN dart2aot /app/bin/server.dart /app/server.dart.aot

CMD []
ENTRYPOINT ["dartaotruntime", "server.dart.aot", "-s", "web"]

EXPOSE 8080