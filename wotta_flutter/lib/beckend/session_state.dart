import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:wotta_core/wotta_core.dart';

enum WebRemoteSessionStatus { off, starting, active }

class WebRemoteSession extends ChangeNotifier {
  WottaAppState appState;
  WottaActions actions;
  WebRemoteSessionStatus status = WebRemoteSessionStatus.off;
  WebSocketChannel _ws;

  WebRemoteSession(this.appState, this.actions);

  open(String sessionUrl) {
    print('DEBUG opening remote web session to ${sessionUrl}');
    _ws = IOWebSocketChannel.connect(sessionUrl);

    _ws.stream.listen(
      (data) {
        print('DEBUG WebRemoteSession get data ${data}');
        status = WebRemoteSessionStatus.active;

        notifyListeners();
      },
      onDone: () {
        debugPrint('ws channel closed');
        status = WebRemoteSessionStatus.off;
        notifyListeners();
      },
      onError: (error) {
        debugPrint('ws error $error');
        status = WebRemoteSessionStatus.off;
        notifyListeners();
      },
    );

    status = WebRemoteSessionStatus.starting;
    notifyListeners();
  }

  close() {
    if (_ws != null) {
      _ws.sink.close();
    }
    status = WebRemoteSessionStatus.off;
    notifyListeners();
  }

  @override
  void dispose() {
    print('INFO dispose on WebRemoteSession');
    _ws.sink.close();
    super.dispose();
  }
}
