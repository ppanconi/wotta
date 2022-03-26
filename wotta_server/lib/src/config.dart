
import 'dart:io';

CONFIG() {
  return {
    'web_websocket_uri' : '/ws/' + Platform.localHostname + '/web',
    'app_websocket_uri' : "/ws/" + Platform.localHostname + '/app'
  };
}