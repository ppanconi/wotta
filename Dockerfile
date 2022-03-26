# Experimental using dart 2.6 developing
# with dart2native tool

FROM google/dart:2.6-dev AS dart-runtime

#RUN pub global activate webdev

#Building wotta_web with local module libs (wotta_core)
#ADD wotta_core/pubspec.yaml /app/wotta_core/
#ADD wotta_core/lib /app/wotta_core/lib/

#ADD wotta_web/pubspec.* /app/wotta_web/
#ADD wotta_web/lib /app/wotta_web/lib/
#ADD wotta_web/web /app/wotta_web/web/

#WORKDIR /app/wotta_web
#RUN pub get

#RUN webdev build

# Build wotta_server
ADD wotta_server/pubspec.* /app/wotta_server/
ADD wotta_server/bin /app/wotta_server/bin/
ADD wotta_server/lib /app/wotta_server/lib/

WORKDIR /app/wotta_server
RUN pub get
RUN dart2native /app/wotta_server/bin/server.dart -o /app/wotta_server/bin/server

#Build wotta_react
FROM node:gallium-alpine3.15 as node-build

ADD wotta_react/package* /app/wotta_react/
ADD wotta_react/craco.config.js /app/wotta_react/
ADD wotta_react/src /app/wotta_react/src/
ADD wotta_react/public /app/wotta_react/public/

WORKDIR /app/wotta_react
RUN npm install
RUN npm run build

FROM frolvlad/alpine-glibc:alpine-3.9_glibc-2.29

COPY --from=node-build /app/wotta_react/build /web
COPY --from=dart-runtime /app/wotta_server/bin/server /server

CMD /server -p $PORT -s web

EXPOSE $PORT