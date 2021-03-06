import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:wotta_core/wotta_core.dart';
import 'package:built_redux/built_redux.dart';

enum WebRemoteSessionStatus { off, starting, active }

class WebRemoteSession extends ChangeNotifier {
//  WottaAppState appState;
//  WottaActions actions;
  Store<WottaAppState, WottaAppStateBuilder, WottaActions> store;
  WebRemoteSessionStatus status = WebRemoteSessionStatus.off;
  String _message = "Off";
  WebSocketChannel _ws;

  WebRemoteSession(this.store);

  set message(String value) {
    _message = value;
    notifyListeners();
  }

  String get message => _message;

  open(String sessionUrl) {
    print('DEBUG opening remote web session to ${sessionUrl}');
    _ws = IOWebSocketChannel.connect(sessionUrl);

    _ws.stream.listen(
      (data) {
        print('DEBUG WebRemoteSession get data ${data}');
        var message = json.decode(data);
        if (message['type'] == 'CHANNEL_READY') {

          var stateData = json.encode(standardSerializers.serializeWith(WottaAppState.serializer, store.state));
          var stateDataMsg = {
            'type': 'STATE_DATA',
            'data': stateData
          };

          _ws.sink.add(json.encode(stateDataMsg));

          status = WebRemoteSessionStatus.active;
          _message = "Active";
          notifyListeners();
        }

      },
      onDone: () {
        debugPrint('ws channel closed');
        status = WebRemoteSessionStatus.off;
        _message = "Off";
        notifyListeners();
      },
      onError: (error) {
        debugPrint('ws error $error');
        status = WebRemoteSessionStatus.off;
        _message = "Error $error";
        notifyListeners();
      },
    );

    status = WebRemoteSessionStatus.starting;
    _message = "Starting ...";
    notifyListeners();
  }

  close() {
    if (_ws != null) {
      _ws.sink.close();
    }
    status = WebRemoteSessionStatus.off;
    _message = "Off";
    notifyListeners();
  }

  @override
  void dispose() {
    print('INFO dispose on WebRemoteSession');
    _ws.sink.close();
    super.dispose();
  }
}
