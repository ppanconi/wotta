import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:server/src/api/api.dart';
import 'package:server/src/sse_proxy.dart';
import 'package:server/src/ws/ws.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

import 'package:shelf_proxy/shelf_proxy.dart';

main(List<String> args) async {
  var parser = ArgParser()
    ..addOption('port', abbr: 'p', defaultsTo: '8080')
    ..addOption('static', abbr: 's', defaultsTo: '../wotta_web/build')
//    ..addOption('static', abbr: 's', defaultsTo: 'NO')
    ..addOption('webdev', abbr: 'd', defaultsTo: 'NO');
//    ..addOption('webdev', abbr: 'd', defaultsTo: 'http://localhost:53322');

  var result = parser.parse(args);

  var port = int.tryParse(result['port']);
  var webdev = result['webdev'];
  var static = result['static'];

  if (port == null) {
    stdout.writeln(
        'Could not parse port value "${result['port']}" into a number.');
    // 64: command line usage error
    exitCode = 64;
    return;
  }

  var cascade = Cascade();

  if (webdev != 'NO') {
    var ssePath  = '/\$sseHandler';
    final proxySse = SseProxyHandler(Uri.parse(ssePath),
        Uri.parse('${webdev}$ssePath'));

    cascade = cascade
        .add(proxySse.handler)
        .add(proxyHandler(webdev));
  }

  if (static != 'NO') {
      var staticHandler = createStaticHandler(static, defaultDocument: 'index.html');
      cascade = cascade.add(staticHandler);
  }

  Router router = Router();
  provideWsHandler(router);
  provideApplicationApi(router, '/api');

  cascade = cascade.add(router.handler);

  var handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(cascade.handler);

  var server = await serve(handler, '0.0.0.0', port);
  print('Serving at http://${server.address.host}:${server.port}');

}