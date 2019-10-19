# Experimental using dart 2.6 developing
# with dart2native tool

FROM google/dart:2.6-dev AS dart-runtime

# we need to run pub get twice
# for the reason see official base image documentation
# @ https://hub.docker.com/r/google/dart

RUN pub global activate webdev

#Building wotta_web with local module libs (wotta_core)
ADD wotta_core/pubspec.yaml /app/wotta_core/
ADD wotta_core/lib /app/wotta_core/lib/

ADD wotta_web/pubspec.* /app/wotta_web/
ADD wotta_web/lib /app/wotta_web/lib/
ADD wotta_web/web /app/wotta_web/web/

WORKDIR /app/wotta_web
RUN pub get

RUN webdev build

# Build wotta_server
ADD wotta_server/pubspec.* /app/wotta_server/
ADD wotta_server/bin /app/wotta_server/bin/
ADD wotta_server/lib /app/wotta_server/lib/

WORKDIR /app/wotta_server
RUN pub get
RUN dart2native /app/wotta_server/bin/server.dart -o /app/wotta_server/bin/server

FROM frolvlad/alpine-glibc:alpine-3.9_glibc-2.29

COPY --from=dart-runtime /app/wotta_web/build /web
COPY --from=dart-runtime /app/wotta_server/bin/server /server

CMD /server -p $PORT -s web

EXPOSE $PORT