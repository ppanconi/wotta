

import 'dart:convert';

import 'package:server/src/config.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

provideApplicationApi(Router router, String prefix) {
  router.get(prefix + '/config', configHandler);

}

Response configHandler(Request request) {

  return Response.ok(jsonEncode(CONFIG));
}
