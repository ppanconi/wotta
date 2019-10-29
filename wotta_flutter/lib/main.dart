import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:built_redux/built_redux.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:wotta_flutter/routes.dart';
import 'beckend/session_state.dart';
import 'middlewares.dart';
import 'package:flutter/services.dart';

import 'package:http_server/http_server.dart';

void main() async {
  var state = await fileStorage.readState();

// block layout orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
//      DeviceOrientation.portraitDown,
  ]).then( (_) {
    runApp( WottaApp(state));
  });


}


class WottaApp extends StatefulWidget {

  final Store<WottaAppState, WottaAppStateBuilder, WottaActions> store;

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }

  WottaApp(WottaAppState state):
    store = Store(
        wottaReducerBuilder.build(), state, WottaActions(),
        middleware: [middlewareBuilder.build(), savingOnFileMiddleware]);
}

class AppState extends State<WottaApp> {
  Store<WottaAppState, WottaAppStateBuilder, WottaActions> store;

  @override
  void initState() {
    store = widget.store;
//    _startWebServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReduxProvider(
      store: store,
      child: ChangeNotifierProvider(
        builder: (context) => WebRemoteSession(store),
        child: MaterialApp(
          title: 'Wotta',
          routes: WottaRoutes.routes,
        )
      )
    );
  }
}

//Future _startWebServer() async {
//  runZoned(() {
//    HttpServer.bind('0.0.0.0', 8000).then((server) {
//
//      server.transform(HttpBodyHandler()).listen((HttpRequestBody body) async {
//        print('Request URI');
//        switch (body.request.uri.toString()) {
//          case '/upload': {
//            if (body.type != "form") {
//              body.request.response.statusCode = 400;
//              body.request.response.close();
//              return;
//            }
//            var foundFile = false;
//            for (var key in body.body.keys.toSet()) {
//              if (key == "file") {
//                foundFile = true;
//              }
//            }
//            if (!foundFile) {
//              body.request.response.statusCode = 400;
//              body.request.response.close();
//              return;
//            }
//            HttpBodyFileUpload data = body.body['file'];
//            // Save file
//            final directory = await getApplicationDocumentsDirectory();
//            File fFile = File('${directory.path}/file');
//            fFile.writeAsBytesSync(data.content);
//            body.request.response.statusCode = 201;
//            body.request.response.close();
//            break;
//          }
//          case '/':
//            {
////              String _content = await _loadStatic('index.html');
//              body.request.response.statusCode = 200;
//              body.request.response.headers.set("Content-Type", "text/html; charset=utf-8");
//              body.request.response.write('<html>Che pisellata</html>');
//              body.request.response.close();
//              break;
//            }
//          default: {
//            body.request.response.statusCode = 404;
//            body.request.response.write('Not found');
//            body.request.response.close();
//          }
//        }
//      });
//      print('Server running at: ${server.address.address}:8000');
//    });
//  },
//      onError: (e, stackTrace) => print('Oh noes! $e $stackTrace'));
//}
