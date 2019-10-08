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
  StreamSubscription appStreamSubscription;

  WebToAppChannel(this.key, this.webWS) {
    webStreamSubscription = webWS.stream.listen((data) =>  webMessagesHandler(data));
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

  void addAppConnection(WebSocketChannel appWs) {
    this.appWS = appWs;

    var ready = {
      'type': 'CHANNEL_READY',
      'key': key
    };
    webWS.sink.add(jsonEncode(ready));
    webWS.sink.addStream(appWs.stream);

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

//    Timer.periodic(Duration(seconds:5), (Timer t) {
//      webSocket.sink.add('Plesase login ${++c}');
//    });
   });

  router.get(CONFIG['web_websocket_uri'], webWsHandler);

  var appWsHandler = enhanceWebSocketHandler((WebSocketChannel appSocket, Request request ) {

    String key = request.url.queryParameters['key'];
    print('INFO got connection from new app client for channel key ${key}');

    var channel = channels[key];
    if (channel != null) {
      channel.addAppConnection(appSocket);
    } else {
      appSocket.sink.close(1003, 'Invalid key');
    }
  });

  router.get(CONFIG['app_websocket_uri'], appWsHandler);

}
