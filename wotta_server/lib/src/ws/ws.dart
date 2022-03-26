import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:server/src/config.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'enhance_websocket_handler.dart';

class WebToAppChannel {
  String key;
  WebSocketChannel webWS;
  StreamSubscription webStreamSubscription;
  WebSocketChannel appWS;

  WebToAppChannel(this.key, this.webWS) {
    webStreamSubscription = webWS.stream.listen((data) =>  webMessagesHandler(data));
  }

  bool isActive() {
    return appWS != null;
  }

  void webMessagesHandler(dynamic msgFromWeb) {
    print('DEBUG reviced message from web ${msgFromWeb}');

    if ( appWS == null ) {
      /**
       * web client initialization message
       */
      var keyMsg = {
        'type': 'KEY',
        'key': key
      };

      webWS.sink.add(jsonEncode(keyMsg));
    } else {
      appWS.sink.add(msgFromWeb);
    }
  }

  void addAppConnection(WebSocketChannel appWs, Function onAppWsClose) {
    this.appWS = appWs;

    var ready = {
      'type': 'CHANNEL_READY',
      'key': key
    };
    webWS.sink.add(jsonEncode(ready));
    webWS.sink.addStream(appWs.stream).whenComplete(() {
      print('DEBUG App ${key} close web session ');
      onAppWsClose();
      webStreamSubscription.cancel();
      webWS.sink.close();
      appWs.sink.close();
    });


  }

}

provideWsHandler(Router router) {

  Map<String, WebToAppChannel> channels = HashMap();
  int c = 0;

  var webWsHandler = webSocketHandler((WebSocketChannel webSocket ) {

    print('INFO got connection from new web client ');

    var key = 'key-${c++}';

    var channel = WebToAppChannel(key, webSocket);
    channels[key] = channel;

   });

  var webWSUrl = CONFIG()['web_websocket_uri'];
  print("INFO open websocket for web side at " + webWSUrl);
  router.get(webWSUrl, webWsHandler);

  var appWsHandler = enhanceWebSocketHandler((WebSocketChannel appSocket, Request request ) {

    String key = request.url.queryParameters['key'];
    print('INFO got connection from new app client for channel key ${key}');

    var channel = channels[key];
    if (channel != null && ! channel.isActive()) {

      channel.addAppConnection(appSocket, () {
        channels.remove(key);

      });
    } else {
      appSocket.sink.close(1003, 'Invalid key');
    }
  });

  var appWSUrl = CONFIG()['app_websocket_uri'];
  print("INFO open websocket for app side at " + appWSUrl);
  router.get(appWSUrl, appWsHandler);

}
