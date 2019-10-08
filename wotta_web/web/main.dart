import 'dart:convert';
import 'dart:html';
import 'package:land/src/land/components/components.dart';
import 'package:land/src/land/qr/qr.dart';
import 'package:over_react/react_dom.dart' as react_dom;
import 'package:over_react/over_react.dart';
import 'package:uri/uri.dart';

void main() async {
  setClientConfiguration();

  String configJson = await getConfig();

  var config = jsonDecode(configJson);
  print('DEBUG config ${configJson}');
//  /print(window.location);

  var wsUriBuilder = UriBuilder.fromUri(Uri.base);
  wsUriBuilder.scheme = 'ws';
  wsUriBuilder.path = config['web_websocket_uri'];

  var wsUri = wsUriBuilder.build();

  print('DEBUG esUri: $wsUri');

  WebSocket webSocket = WebSocket(wsUri.toString());

  AppProps appBuilder = App();
  appBuilder.initialStatus = 'loading ...';
  appBuilder.webSocket = webSocket;

  // Mount / render your component.
  react_dom.render(appBuilder(), querySelector('#react_mount_point'));

}

//void main() async {
//
//  querySelector('#output').text = '...';
//
//  String configJson = await getConfig();
//
//  querySelector('#output').text = configJson;
//  var config = jsonDecode(configJson);
//
//  print(window.location);
//
//  var wsUriBuilder = UriBuilder.fromUri(Uri.base);
//  wsUriBuilder.scheme = 'ws';
//  wsUriBuilder.path = config['web_websocket_uri'];
//
//  var wsUri = wsUriBuilder.build();
//
//  print('esUri: $wsUri');
//
//  var webSocket = WebSocket(wsUri.toString());
//  webSocket.onMessage.listen((MessageEvent e) {
//    querySelector('#messages').appendHtml('<p>${e.data}</p>');
//  });
//
//  webSocket.onOpen.listen((e) {
//    print('Connected');
//    webSocket.send('hello!');
//  });
//
//}

//main() {
//  // Initialize React within our Dart app
//  setClientConfiguration();
//
//  // Mount / render your component.
//  react_dom.render(Foo()(), querySelector('#react_mount_point'));
//}


Future<String> getConfig() async {
  const path = '/api/config';
  try {
    // Make the GET request
    final String text = await HttpRequest.getString(path);
    return text;
  } catch (e) {
    // The GET request failed. Handle the error.
    print('Couldn\'t open $path');
    return 'Request failed.';
  }
}