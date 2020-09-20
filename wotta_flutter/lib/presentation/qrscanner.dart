import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wotta_flutter/beckend/session_state.dart';

class ScanScreen extends StatelessWidget {
//  String barcode = "";

  static final GlobalKey<FormFieldState<String>> _inputKey =
      GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: new AppBar(
//          title: new Text('QR Code Scanner'),
//        ),
        body: new Center(
      child: Consumer<WebRemoteSession>(builder: (context, webSession, child) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                child: TextFormField(
//                  style: Theme.of(context).textTheme.headline,
//                  autofocus: true,
//                  key: _inputKey,
//                  initialValue: 'ws://10.0.2.2:9999/appws?key=key-',
//                ),
//              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    onPressed: () {
                      if (webSession.status == WebRemoteSessionStatus.off) {
//                        webSession.open(_inputKey.currentState.value);
                          scan(webSession);
                      } else {
                        webSession.close();
                      }

                    },
                    child: Text(webSession.status == WebRemoteSessionStatus.off ? 'Allow Web Session' : 'Close Web Session')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Web session is  ${webSession.message}',
                  textAlign: TextAlign.center,
                ),
              )
            ]);
      }),
    ));
  }

  Future scan(WebRemoteSession webSession) async {
    try {
      String barcode = await BarcodeScanner.scan();
//      setState(() => this.barcode = barcode);
      webSession.open(barcode);

    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
//        setState(() {
//          this.barcode = 'The user did not grant the camera permission!';
//        });
          webSession.message = 'The user did not grant the camera permission!';
      } else {
//        setState(() => this.barcode = 'Unknown error: $e');
          webSession.message = 'Unknown error: $e';
      }
    } on FormatException{
//      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
//      setState(() => this.barcode = 'Unknown error: $e');
        webSession.message = 'Unknown error: $e';
    }
  }
}
